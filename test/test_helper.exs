ExUnit.start()

Mox.defmock(SendGmail.GothMock, for: SendGmail.Goth.Behaviour)
Mox.defmock(SendGmail.MailerMock, for: SendGmail.Mailer.Behaviour)

# Application.put_env(:send_gmail, :goth_client, SendGmail.Goth)
