defmodule KanbanBoard.CategoryJSON do
  alias KanbanBoard.Categories

  def index(%{categories: categories}) do
    %{data: for(category <- categories, do: data(categories))}
  end

  def show(%{categories: categories}) do
    %{data: data(categories)}
  end

  defp data(%Categories{} = categories) do
    %{
      id: categories.id,
      name: customer.name
    }
  end
end
