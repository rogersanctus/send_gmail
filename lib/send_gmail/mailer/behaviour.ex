defmodule SendGmail.Mailer.Behaviour do
  @moduledoc """
  The Mailer behaviour
  """

  @callback deliver(Swoosh.Email.t(), Keyword.t()) :: {:ok, term()} | {:error, term()}
end
