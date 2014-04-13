defmodule Httparrot.Mixfile do
  use Mix.Project

  def project do
    [ app: :httparrot,
      version: "0.0.3",
      name: "HTTParrot",
      elixir: "0.13.0-dev",
      deps: deps(Mix.env) ]
  end

  def application do
    [ applications: [ :compiler,
                      :syntax_tools,
                      :cowboy,
                      :jsex ],
      mod: { HTTParrot, [] },
      env: [ http_port: 8080, ssl: true, https_port: 8433 ] ]
  end

  defp deps(:dev) do
    [ {:cowboy, github: "extend/cowboy", tag: "0.9.0" },
      {:jsex, github: "raycmorgan/jsex" } ]
  end

  defp deps(:test) do
    deps(:dev) ++
     [ {:meck, github: "eproxus/meck", ref: "638e699fd99cb4d0fc97601d218486eed6c7fa9e" } ]
  end

  defp deps(_), do: deps(:dev)
end
