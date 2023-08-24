defmodule SendGmail.GothOfSuccess do
  @moduledoc """
  A Goth implementation with sucess only functions
  """

  @behaviour SendGmail.Goth.Behaviour

  def fetch() do
    {:ok,
     %Goth.Token{token: "that fresh and tasting token", expires: 1, scope: "all", type: "Bearer"}}
  end
end
