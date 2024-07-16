defmodule KanbanBoard.Card do
  use Ecto.Schema
  import Ecto.Changeset
  alias KanbanBoard.Category

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "cards" do
    field :title, :string
    field :description, :string
    field :ticket_number, :string
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :description, :ticket_number, :category_id])
    |> validate_required(attrs, [:title, :ticket_number, :category_id])
    |> foreign_key_constraint(:category_id)
    # to check kung existing yung category id
  end
end
