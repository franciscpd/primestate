defmodule Primestate.MixProject do
  use Mix.Project

  def project do
    [
      app: :primestate,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Primestate.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:absinthe, "~> 1.7.0"},
      {:absinthe_plug, "~> 1.5.8"},
      {:absinthe_phoenix, "~> 2.0"},
      {:absinthe_relay, "~> 1.5"},
      {:bamboo, "~> 2.2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dart_sass, "~> 0.5", runtime: Mix.env() == :dev},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ecto_psql_extras, "~> 0.7"},
      {:ecto_sql, "~> 3.6"},
      {:esbuild, "~> 0.3", runtime: Mix.env() == :dev},
      {:excoveralls, "~> 0.14 and >= 0.14.4", only: [:test]},
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0"},
      {:ex_doc, "~> 0.28.4", only: [:dev], runtime: false},
      {:ex_machina, "~> 2.7.0"},
      {:floki, ">= 0.30.0"},
      {:gettext, "~> 0.18"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"},
      {:live_ui_kit, "~> 0.1.7"},
      {:mox, "~> 1.0"},
      {:oban, "~> 2.12"},
      {:phoenix, "~> 1.6.6"},
      {:phoenix_ecto, "~> 4.4"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:plug_cowboy, "~> 2.5"},
      {:postgrex, ">= 0.0.0"},
      {:premailex, "~> 0.3.0"},
      {:sobelow, "~> 0.8", only: :dev},
      {:sweet_xml, "~> 0.6"},
      {:swoosh, "~> 1.3"},
      {:tailwind, "~> 0.1.6", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:waffle, "~> 1.1.1"},
      {:waffle_ecto, "~> 0.0.9"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "assets.build"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "assets.build": [
        "esbuild default",
        "sass default",
        "tailwind default"
      ],
      "assets.deploy": [
        "esbuild default --minify",
        "sass default",
        "tailwind default --minify",
        "phx.digest"
      ]
    ]
  end
end
