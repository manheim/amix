defmodule PlugNewrelic.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_newrelic,
     version: "0.0.4",
     elixir: "~> 1.0",
     deps: dependencies,
     package: package,
     description: description
   ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:newrelic],
     mod: {PlugNewrelic, []}
   ]
  end

  # Dependencies can be hex.pm packages:
  defp dependencies do 
    [
      {:plug, "~> 1.1.2"},
      {:newrelic, github: "wooga/newrelic-erlang"}
    ]
  end

  defp package do
    [
      name: :plug_newrelic,
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/manheim/amix"}
    ]
  end

  defp description do
    """
      Wraps New Relic transaction tracing into a plug.
    """
  end
end

