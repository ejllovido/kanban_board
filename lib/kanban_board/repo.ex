defmodule KanbanBoard.Repo do
  use Ecto.Repo,
    otp_app: :kanban_board,
    adapter: Ecto.Adapters.Postgres
end
