# SendGmail

A simple Elixir project to test Gmail API to send emails.

This project was made using TDD (Test Driven Design) techniques, with the help of the following libraries: [Mox](https://github.com/dashbitco/mox) (for modules Mocking), [mix test.watch](https://github.com/lpil/mix-test.watch) (to keep tests running and watching for file changes) and [Dotenvy](https://github.com/fireproofsocks/dotenvy) (to load .env files into the environment).

The email delivering is handled by the great lib [Swoosh](https://github.com/swoosh/swoosh) and its `Swoosh.Adapter.Gmail`. And finally, for the OAuth2 authentication the [Goth](https://github.com/peburrows/goth) lib is being used.