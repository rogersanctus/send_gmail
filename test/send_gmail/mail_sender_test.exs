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

  describe("MailSender") do
    test "if it fails when Goth can get a token from Google OAuth2" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfFailure)
      Mox.stub(SendGmail.MailerMock, :deliver, fn _email, _config -> {:ok, "unreached"} end)

      result = MailSender.send_message(message(), sender())

      goth_error = SendGmail.GothOfFailure.goth_error()
      assert match?({:error, ^goth_error}, result)
    end
  end
end
