defmodule ElixirLokaliseApi.MixProject do
  use Mix.Project

  @source_url "https://github.com/lokalise/elixir-lokalise-api"
  @version "2.0.0"

  def project do
    [
      app: :elixir_lokalise_api,
      version: @version,
      elixir: "~> 1.10",
      name: "ElixirLokaliseApi",
      package: package(),
      docs: docs(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8.0"},
      {:jason, "~> 1.2"},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:exvcr, "~> 0.13.2", only: :test},
      {:excoveralls, "~> 0.14.2", only: :test}
    ]
  end

  def docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"],
      ],
      main: "readme",
      homepage_url: @source_url,
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end

  defp package do
    [
      description: "Lokalise APIv2 interface for Elixir.",
      maintainers: ["Ilya Bodrov-Krukowski"],
      licenses: ["BSD-3-Clause"],
      links: %{
        "Changelog" => "https://lokalise.github.io/elixir-lokalise-api/additional_info/changelog",
        "GitHub" => @source_url
      }
    ]
  end
end
