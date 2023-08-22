defmodule SendGmailTest do
  @moduledoc false

  use ExUnit.Case, async: false

  test "greets the world" do
    dotenv = Application.get_env(:send_gmail, :dotenv)

    assert match?(%{"client_id" => _, "client_secret" => _, "refresh_token" => _, "mailing_email" => _}, dotenv)

    %{"client_id" => client_id, "client_secret" => client_secret, "refresh_token" => refresh_token, "mailing_email" => mailing_email} = dotenv

    assert not is_nil(client_id)
    assert not is_nil(client_secret)
    assert not is_nil(refresh_token)
    assert not is_nil(mailing_email)
  end
end
