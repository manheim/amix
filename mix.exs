defmodule PlugNewrelic.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_newrelic,
     version: "0.0.7",
     elixir: "~> 1.0",
     deps: deps(),
     package: package(),
     description: description()
   ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:newrelic],
     mod: {PlugNewrelic, []}
   ]
  end

  # Dependencies can be hex.pm packages:
  defp deps do
    [
      {:plug, "~> 1.0"},
      {:newrelic, "~> 0.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      name: :plug_newrelic,
      licenses: ["MIT"],
      maintainers: ["Manheim"],
      links: %{"Github" => "https://github.com/manheim/amix"}
    ]
  end

  defp description do
    """
      Wraps New Relic transaction tracing into a plug.
    """
  end
end

