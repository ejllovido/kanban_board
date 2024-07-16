defmodule KanbanBoardWeb.CardController do
  # business logic
  use KanbanBoardWeb, :controller

  alias KanbanBoard.Cards
  alias KanbanBoard.Card

  action_fallback KanbanBoard.FallbackController

  def index(conn, _params) do
    cards = Cards.list_cards()
    render(conn, :index, cards: cards)
  end

  def create(conn, %{"card" => card_params}) do
    with {:ok, %Card{} = card} <- Cards.create_card(card_params)
    do
      conn
      |> put_status(:created)
      |> render(:show, card: card)
    end
  end

  def show(conn, %{"id" => id}) do
    card = Cards.get_card(id)
    render(conn, :show, card: card)
  end

  def update(conn, %{"id" => id, "card" => card_params}) do
    card = Cards.get_card(id)

    with {:ok, %Card{} = card} <- Cards.update_card(card, card_params)
    do
      render(conn, :show, card: card)
    end
  end

  def delete(conn, %{"id" => id}) do
    card = Cards.get_card(id)

    with {:ok, %Card{}} <- Cards.delete_card(card)
    do
      render(conn, :show, card: card)
    end
  end
end
