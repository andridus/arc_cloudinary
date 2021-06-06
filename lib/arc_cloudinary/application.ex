defmodule ArcCloudinary.Application do
 
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {ArcCloudinary.CloudexStart, []}
      # {T.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: T.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
