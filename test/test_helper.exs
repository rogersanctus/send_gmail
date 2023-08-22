ExUnit.start()

Mox.defmock(SendGmail.GothMock, for: SendGmail.Goth.Behavior)
Mox.defmock(SendGmail.MailerMock, for: Swoosh.Adapter)

# Application.put_env(:send_gmail, :goth_client, SendGmail.Goth)
