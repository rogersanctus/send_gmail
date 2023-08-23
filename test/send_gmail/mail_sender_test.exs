defmodule SendGmail.MailSenderTest do
  @moduledoc false

  use ExUnit.Case

  alias SendGmail.MailSender

  defp sender do
    %{
      full_name: "John Doe",
      email: "john@doe"
    }
  end

  defp message() do
    "A nice to see e-mail message."
  end

  defp mailer_client_success() do
    "mailer client success"
  end

  describe("MailSender") do
    test "if it fails when Goth can get a token from Google OAuth2" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfFailure)

      # Expects the deliver function is not called (0 times)
      Mox.expect(SendGmail.MailerMock, :deliver, 0, fn _email, _config -> {:ok, "unreached"} end)

      result = MailSender.send_message(message(), sender())

      goth_error = SendGmail.GothOfFailure.goth_error()
      assert match?({:error, ^goth_error}, result)
    end

    test "if it fails when Mailer fails to send the e-mail" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfSuccess)

      Mox.stub(SendGmail.MailerMock, :deliver, fn _email, _config ->
        {:error, "mailer client failure"}
      end)

      result = MailSender.send_message(message(), sender())

      assert match?({:error, "mailer client failure"}, result)
    end

    test "if mailer client is called with the right arguments" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfSuccess)

      # Expects the deliver function is called and called once
      Mox.expect(SendGmail.MailerMock, :deliver, 1, fn %Swoosh.Email{
                                                         text_body: text_body,
                                                         from: from,
                                                         to: to
                                                       },
                                                       [access_token: _] ->
        dotenv = Application.get_env(:send_gmail, :dotenv)
        mailing_email = Map.get(dotenv, "mailing_email")
        contact = {"Mailing Contact", mailing_email}
        message = message()

        assert match?(^message, text_body)
        assert match?(^contact, from)
        assert match?([^contact], to)

        {:ok, mailer_client_success()}
      end)

      MailSender.send_message(message(), sender())

      Mox.verify!()
    end

    test "if it can send a message to the sender contact when everything is right" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfSuccess)
      Mox.stub(SendGmail.MailerMock, :deliver, fn _, _ -> {:ok, mailer_client_success()} end)

      mailer_client_success = mailer_client_success()
      result = MailSender.send_message(message(), sender())
      assert match?({:ok, [:mail_sent, ^mailer_client_success]}, result)
    end
  end
end
