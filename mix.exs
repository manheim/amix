defmodule Amix.Mixfile do
  use Mix.Project

  def project do
    [app: :amix,
     version: "0.0.3",
     elixir: "~> 1.0",
     deps: deps_by_env(Mix.env)],
     package: package,
     description: description
  end

  # Configuration for the OTP application
  def application do
    [applications: [:newrelic],
     mod: {Amix, []}
   ]
  end

  # Dependencies can be hex.pm packages:
  defp deps_by_env(_) do
    [
      {:plug, "~> 1.1.2"},
      {:newrelic, github: "wooga/newrelic-erlang"}
    ]
  end

  defp package do
    [
      name: :plug_newrelic,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"]
    ]
  end

  defp description do
    """
      Wraps New Relic transaction tracing into a plug.
    """
  end
end

