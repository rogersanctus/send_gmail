defmodule SendGmail.GothOfSuccess do
  @moduledoc """
  A Goth implementation with sucess only functions
  """

  @behaviour SendGmail.Goth.Behavior

  def fetch() do
    {:ok, %Goth.Token{token: "aquele_token_gostosinho", expires: 1, scope: "all", type: "Bearer"}}
  end
end
