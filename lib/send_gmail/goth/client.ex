defmodule SendGmail.Goth.Client do
  @moduledoc """
  Goth wrapper to implement GothBehaviour
  """

  @behaviour SendGmail.Goth.Behaviour

  def fetch() do
    goth_client = Application.get_env(:send_gmail, :goth_client, Goth)
    goth_client.fetch(__MODULE__)
  end
end
