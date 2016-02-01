defmodule Gst.Store do
  use GenServer

  # client interface
  def start do
    GenServer.start(__MODULE__, nil, name: :gst)
  end

  def put(key, value) do
    GenServer.cast(:gst, {:put, key, value})
  end

  def get(key) do
    GenServer.call(:gst, {:get, key})
  end

  def all do
    GenServer.call(:gst, {:all})
  end

  def clear do
    GenServer.cast(:gst, {:clear})
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
