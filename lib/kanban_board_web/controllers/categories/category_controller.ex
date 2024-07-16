defmodule KanbanBoardWeb.CategoryController do
  # business logic
  use KanbanBoardWeb, :controller

  alias KanbanBoard.Categories
  alias KanbanBoard.Category

  action_fallback KanbanBoard.FallbackController

  def index(conn, _params) do
    categories = Categories.list_categories()
    render(conn, :index, categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    with {:ok, %Category{} = category} <- Category.create_category(category_params)
    do
      conn
      |> put_status(:created)
      |> render(:show, category: category)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Category.get_category(id)
    render(conn, :show, category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Category.get_category(id)

    with {:ok, %Category{} = category} <- Category.update_category(category, category_params)
    do
      render(conn, :show, category: category)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Category.get_category(id)

    with {:ok, %Category{}} <- Category.delete_category(category)
    do
      render(conn, :show, category: category)
    end
  end
end
