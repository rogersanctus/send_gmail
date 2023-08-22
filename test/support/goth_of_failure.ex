defmodule SendGmail.GothOfFailure do
  @moduledoc """
  A Goth implementation with sucess only functions
  """

  @behaviour SendGmail.Goth.Behavior

  def fetch() do
    {:error, goth_error()}
  end

  def goth_error() do
    "any Goth error"
  end
end
