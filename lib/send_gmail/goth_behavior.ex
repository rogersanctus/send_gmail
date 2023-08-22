defmodule SendGmail.Goth.Behavior do
  @moduledoc """
  Defines the behaviour of Goth module
  """

  @callback fetch() :: {:ok, Goth.Token.t()} | {:error, any()}
end
