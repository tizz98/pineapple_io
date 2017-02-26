defmodule PineappleIo.Link do
  use PineappleIo.Web, :model

  schema "links" do
    field :title, :string
    field :submitted_on, Ecto.DateTime
    field :rank_score, :float
    field :url, :string
    field :description, :string
    belongs_to :submitter, PineappleIo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :submitted_on, :rank_score, :url, :description])
    |> validate_required([:title, :submitted_on, :rank_score, :url, :description])
  end
end
