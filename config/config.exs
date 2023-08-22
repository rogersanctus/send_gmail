import Config

config :logger, level: :info

# Configures mix-test.watch to clear the screen before each test suite and
# to include the timestamp
config :mix_test_watch, clear: true, timestamp: true

# Setup the Swoosh Mailer adapter to Gmail adapter within the application
config :send_gmail, SendGmail.Mailer, adapter: Swoosh.Adapters.Gmail

# Setup the Swoosh http client used to do the API calls
# Setting to Finch as it's the same as Goth is using.
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: SendGmail.Finch

import_config("#{config_env()}.exs")
