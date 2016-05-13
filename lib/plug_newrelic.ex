defmodule PlugNewrelic do
  use Application


  def init(opts) do
    opts
  end

  def start(_type, _args) do
    PlugNewrelic.Supervisor.start_link
  end
end


