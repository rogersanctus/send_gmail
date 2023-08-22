defmodule SendGmail.Goth do
  @moduledoc """
  Goth wrapper to implement GothBehavior
  """

  @behaviour SendGmail.Goth.Behavior

  def fetch() do
    goth_client = Application.get_env(:send_gmail, :goth_client, Goth)
    goth_client.fetch(__MODULE__)
  end
end
