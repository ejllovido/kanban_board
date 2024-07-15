defmodule KanbanBoard.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias KanbanBoard.Card

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "categories" do
    field :name, :string
    has_many :cards, Card

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
