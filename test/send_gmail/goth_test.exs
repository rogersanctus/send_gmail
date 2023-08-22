defmodule SendGmail.GothTest do
  @moduledoc false

  use ExUnit.Case

  # setup_all Mox.verify_on_exit!()

  describe("Test Goth") do
    test "if it can fetch credentials" do
      Mox.stub_with(SendGmail.GothMock, SendGmail.GothOfSuccess)

      client = Application.get_env(:send_gmail, :goth_client)

      assert match?({:ok, %Goth.Token{token: "that fresh and tasting token"}}, client.fetch())
    end
  end
end
