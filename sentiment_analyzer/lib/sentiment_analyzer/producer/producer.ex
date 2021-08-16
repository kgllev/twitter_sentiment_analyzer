defmodule SentimentAnalyzer.Producer do

  use GenServer

  def start_link()do
    GenServer.start_link(__MODULE__,  %{socket: nil})
  end

  def send_message(pid, message)do
    GenServer.cast(pid, message)
  end

  #server
  def handle_cast(message, socket)do
    :gen_tcp.send(socket, message)
   {:noreply, socket}
  end

  def init(state)do
    {:ok, socket} =  :gen_tcp.connect({127,0,0,1}, 2399, [:binary, packet: :line, active: false, reuseaddr: true])
    {:ok, socket}
  end


end
