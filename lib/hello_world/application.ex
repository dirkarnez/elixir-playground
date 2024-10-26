defmodule HelloWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Hello world")
    children = [
      # Starts a worker by calling: HelloWorld.Worker.start_link(arg)
      # {HelloWorld.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    {:ok, pid} = Supervisor.start_link(children, opts)
    IO.puts("active: #{Supervisor.count_children(pid).active}")
    {:ok, pid}
  end
end
