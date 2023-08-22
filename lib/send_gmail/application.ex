defmodule SendGmail.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Finch, [name: SendGmail.Finch]},
      {Goth, [name: SendGmail.Goth, source: goth_source()]}
    ]

    opts = [
      strategy: :one_for_one,
      name: SendGmail.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end

  defp goth_source() do
    dotenv = Application.get_env(:send_gmail, :dotenv)

    credentials = %{
      "client_id" => Map.get(dotenv, "client_id"),
      "client_secret" => Map.get(dotenv, "client_secret"),
      "refresh_token" => Map.get(dotenv, "refresh_token")
    }

    {:refresh_token, credentials}
  end
end
