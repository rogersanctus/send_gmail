defmodule SendGmail.MixProject do
  use Mix.Project

  def project do
    [
      app: :send_gmail,
      version: "0.1.0",
      elixir: "~> 1.15",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {SendGmail.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenvy, "~> 0.8"},
      {:finch, "~> 0.16"},
      {:swoosh, "~> 1.11"},
      {:goth, "~> 1.4"},
      {:mail, ">= 0.0.0"},
      {:mox, "~> 1.0", only: [:test]},
      {:mix_test_watch,
       git: "https://github.com/rogersanctus/mix-test.watch",
       branch: :master,
       only: [:dev, :test],
       runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
