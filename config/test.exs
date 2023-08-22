import Config

# Setup the Goth and Mailer clients modules for test environment.
config :send_gmail,
  goth_client: SendGmail.GothMock,
  mailer_client: SendGmail.MailerMock
# config :send_gmail, SendGmail.Mailer, adapter: Swoosh.Adapters.Test
