defmodule KanbanBoardWeb.CategoryJSON do
  alias KanbanBoard.Category
  alias KanbanBoardWeb.CardJSON

  def index(%{categories: categories}) do
    %{data: for(category <- categories, do: data(category))}
  end

  def show(%{category: category}) do
    %{data: data(category)}
  end

  def render_one(%Category{} = category) do
    data(category)
  end

  def render_one(_category), do: nil

  def render_many(categories) when is_list(categories) do
    for(category <- categories, do: data(category))
  end

  def render_many(_categories), do: []

  defp data(%Category{} = category) do
    %{
      id: category.id,
      name: category.name,
      cards: CardJSON.render_many(category.cards)
    }
  end
end
