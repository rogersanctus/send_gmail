defmodule SendGmail.Goth do
  @behaviour SendGmail.Goth.Behaviour

  def fetch() do
    client = Application.get_env(:send_gmail, :goth_client, SendGmail.Goth.Client)

    client.fetch()
  end
end
