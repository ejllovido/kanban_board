defmodule KanbanBoardWeb.CardJSON do
  alias KanbanBoard.Card
  alias KanbanBoardWeb.CategoryJSON

  def index(%{cards: cards}) do
    %{data: for(card <- cards, do: data(card))}
  end

  def show(%{card: card}) do
    %{data: data(card)}
  end

  def render_one(%Card{} = card) do
    data(card)
  end

  def render_one(_card), do: nil

  def render_many(cards) when is_list(cards) do
    for(card <- cards, do: data(card))
  end

  def render_many(_cards), do: []

  defp data(%Card{} = card) do
    %{
      id: card.id,
      title: card.title,
      description: card.description,
      ticket_number: card.ticket_number,
      category: CategoryJSON.render_one(card.category)
    }
  end
end
