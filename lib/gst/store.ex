defmodule Gst.Store do
  use GenServer

  # server callbacks
  def init(_) do
    IO.puts "Gst.Store init"
    { :ok, Map.new }
  end

  def handle_cast({:put, key, value}, state) do
    IO.puts "Gst.Store put"
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call(:get, key}, _from, state) do
    IO.puts "Gst.Store get"
    {:reply, Map.get(state, key), state}
  end

end
