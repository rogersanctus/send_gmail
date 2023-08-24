defmodule SendGmail.Mailer do
  @behaviour SendGmail.Mailer.Behaviour

  def deliver(email, config) do
    client = Application.get_env(:send_gmail, :mailer_client, SendGmail.Mailer.Client)

    client.deliver(email, config)
  end
end
