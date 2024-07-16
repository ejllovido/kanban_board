defmodule KanbanBoard.CardJSON do
  alias KanbanBoard.Cards

  def index(%{cards: cards}) do
    %{data: for(card <- cards, do: data(cards))}
  end

  def show(%{cards: cards}) do
    %{data: data(cards)}
  end

  defp data(%Cards{} = cards) do
    %{
      id: cards.id,
      title: cards.title,
      description: cards.description,
      ticket_number: cards.ticket_number
    }
  end
end
