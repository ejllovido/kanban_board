defmodule KanbanBoard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KanbanBoardWeb.Telemetry,
      KanbanBoard.Repo,
      {DNSCluster, query: Application.get_env(:kanban_board, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KanbanBoard.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KanbanBoard.Finch},
      # Start a worker by calling: KanbanBoard.Worker.start_link(arg)
      # {KanbanBoard.Worker, arg},
      # Start to serve requests, typically the last entry
      KanbanBoardWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KanbanBoard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KanbanBoardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
