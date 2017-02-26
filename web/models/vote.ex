defmodule PineappleIo.Vote do
  use PineappleIo.Web, :model

  schema "votes" do
    belongs_to :voter, PineappleIo.User
    belongs_to :link, PineappleIo.Link

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
