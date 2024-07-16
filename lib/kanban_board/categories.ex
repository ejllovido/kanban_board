defmodule KanbanBoard.Categories do
  import Ecto.Query, warn: false

  alias KanbanBoard.Category
  alias KanbanBoard.Repo

  def list_categories do
    Category
    |> Repo.all()
    |> Repo.preload(:cards)
  end

  def get_category(id) do
    Repo.get(Category, id)
  end

  def create_category(attrs) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  def update_category(category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  def delete_category(category) do
    Repo.delete(category)
  end
end
