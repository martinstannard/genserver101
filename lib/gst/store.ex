defmodule Gst.Store do
  use GenServer

  # client interface
  def start do
    GenServer.start(__MODULE__, nil)
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  # server callbacks
  def init(_) do
    IO.puts "Gst.Store init"
    { :ok, Map.new }
  end

  def handle_cast({:put, key, value}, state) do
    IO.puts "Gst.Store put"
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _from, state) do
    IO.puts "Gst.Store get"
    {:reply, Map.get(state, key), state}
  end

end
