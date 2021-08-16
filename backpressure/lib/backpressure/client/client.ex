defmodule Backpressure.Consumer do

  use GenServer
  require Logger

  def start_link()do
    GenServer.start_link(__MODULE__, %{socket: nil})
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    IO.inspect data
  end

  defp serve(socket) do
    socket
    |> read_line()
    serve(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    serve(client)
    loop_acceptor(socket)
  end

  def init(state)do
    {:ok, socket} = :gen_tcp.listen(2399, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Accepting connections on port #{2399}")
    loop_acceptor(socket)
  end
end
