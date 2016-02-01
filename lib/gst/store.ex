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

  def all(pid) do
    GenServer.call(pid, {:all})

  def clear(pid) do
    GenServer.cast(pid, {:clear})
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

  def handle_cast({:clear}, state) do
    IO.puts "Gst.Store clear"
    {:noreply, Map.new}
  end

  def handle_call({:get, key}, _from, state) do
    IO.puts "Gst.Store get"
    {:reply, Map.get(state, key), state}
  end

  def handle_call({:all}, _from, state) do
    IO.puts "Gst.Store all"
    {:reply, state, state}
  end

end
