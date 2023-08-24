defmodule SendGmail.MailSender do
  @moduledoc """
  Sends messages via e-mail.
  """

  def compose_email(%{full_name: full_name, email: email} = _sender, message) do
    dotenv = Application.get_env(:send_gmail, :dotenv, %{})
    mailing_email = Map.get(dotenv, "mailing_email")

    Swoosh.Email.new()
    |> Swoosh.Email.to({"Mailing Contact", mailing_email})
    |> Swoosh.Email.from({"Mailing Contact", mailing_email})
    |> Swoosh.Email.subject("Contact from #{full_name} - #{email}")
    |> Swoosh.Email.text_body(message)
  end

  def send_message(nil) do
    {:error, :noop}
  end

  def send_message(message, sender) when is_binary(message) do
    email =
      compose_email(sender, message)

    SendGmail.Goth.fetch()
    |> auth_send_email(email)
  end

  defp auth_send_email({:error, error}, _email), do: {:error, error}

  defp auth_send_email({:ok, %{token: token}}, email) do
    case SendGmail.Mailer.deliver(email, access_token: token) do
      {:ok, deliver_result} -> {:ok, [:mail_sent, deliver_result]}
      {:error, error} -> {:error, error}
      _ -> {:error, :unknown_send_mail_error}
    end
  end
end
