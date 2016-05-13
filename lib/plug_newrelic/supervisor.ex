defmodule PlugNewrelic.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)

    :statman_server.add_subscriber(:statman_aggregator)

    :newrelic_poller.start_link(fn -> :newrelic_statman.poll end)

  end

  def init(:ok) do
    children = [
      #worker(:statman_server, [1000]),
      worker(:statman_aggregator, [])
    ]

    supervise(children, strategy: :one_for_one)
  end

end

