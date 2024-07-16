defmodule KanbanBoard.CardJSON do
  alias KanbanBoard.Card

  def index(%{cards: cards}) do
    %{data: for(card <- cards, do: data(card))}
  end

  def show(%{card: card}) do
    %{data: data(card)}
  end

  defp data(%Card{} = card) do
    %{
      id: card.id,
      title: card.title,
      description: card.description,
      ticket_number: card.ticket_number
    }
  end
end
