defmodule KanbanBoard.Cards do
  # logic para sa database
  import Ecto.Query, warn: false

  alias KanbanBoard.Card
  alias KanbanBoard.Repo

  def list_cards do
    Card
    |> Repo.all()
    |> Repo.preload(:category)
  end

  def get_card(id) do
    Repo.get(Card, id)
  end

  def create_card(attrs) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  def update_card(card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  def delete_card(card) do
    Repo.delete(card)
  end
end
