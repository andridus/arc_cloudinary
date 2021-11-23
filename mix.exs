defmodule ArcCloudinary.MixProject do
  use Mix.Project

  @version "0.1.0"
  def project do
    [
      app: :arc_cloudinary,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ArcCloudinary.Application, []}
    ]
  end


  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:arc, "~> 0.11"},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12", only: :test},
      {:cloudex, "~> 1.3.0", runtime: false},
      {:httpoison, "~> 1.5.1"},
      {:jason, "~> 1.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description do
    """
    Provides Cloudinary Storage backend for Arc.
    """
  end

  defp package do
    [
      maintainers: ["Helder de Sousa"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/andridus/arc_cloudinary"},
      files: ~w(mix.exs README.md lib)
    ]
  end
end
