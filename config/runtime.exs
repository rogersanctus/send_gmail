import Config

dotenv =
  [".env", ".env.#{config_env()}", System.get_env()]
  |> Dotenvy.source!()

Application.put_env(:send_gmail, :dotenv, dotenv)
