defmodule Polling do
  @moduledoc false
  use GenServer
  
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(state) do
    schedule_work(0)
    {:ok, state}
  end
  
  def handle_info(:check, state) do
    import IEx
#    IEx.pry
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work(interval \\ 5 * 1000) do
    Process.send_after(self(), :check, interval)
  end
end
