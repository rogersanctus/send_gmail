defmodule SendGmail.Mailer do
  @moduledoc """
  The Google Api Mailer
  """

  use Swoosh.Mailer, otp_app: :send_gmail
end
