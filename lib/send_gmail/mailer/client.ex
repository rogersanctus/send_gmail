defmodule SendGmail.Mailer.Client do
  @moduledoc """
  The Google Api Mailer
  """
  @behaviour SendGmail.Mailer.Behaviour

  use Swoosh.Mailer, otp_app: :send_gmail
end
