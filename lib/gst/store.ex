defmodule Gst.Store do
  use GenServer

  def init(_) do
    IO.puts "Gst.Store init"
    { :ok, Map.new }
  end

end
