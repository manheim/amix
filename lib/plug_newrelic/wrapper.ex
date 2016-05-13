defmodule PlugNewrelic.Wrapper do
  @behaviour Plug

  def init(opts) do
    opts
  end


  def call(conn, opts) do
    start_time = :erlang.now
    Plug.Conn.register_before_send(conn, fn(c) -> monitor_result(c, start_time) end)
  end

  def monitor_result(%Plug.Conn{status: sts} = conn, stime) when sts >= 400 do
    _monitor_result conn, stime
    spawn fn ->
      path = "/#{Enum.join(conn.path_info, "/")}"
      :statman_counter.incr {path, {:error, {"#{sts}",  "#{conn.resp_body}"}}} 
    end
    conn
  end

  def monitor_result(conn, stime) do
    _monitor_result conn, stime
    conn
  end

  defp _monitor_result(conn, stime) do
    spawn fn ->
      value = :timer.now_diff :erlang.now, stime
      path = "/#{Enum.join(conn.path_info, "/")}"
      :statman_histogram.record_value {path, :total} ,value
    end
  end

end
