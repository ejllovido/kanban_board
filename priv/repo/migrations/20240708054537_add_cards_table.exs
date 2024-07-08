defmodule KanbanBoard.Repo.Migrations.AddCardsTable do
  use Ecto.Migration

  def change do
    create table("cards") do
      add :title, :string
      add :description, :text
      add :ticket_number, :string
      add :category_id, references("categories")

      timestamps()
    end
  end
end
