defmodule PineappleIo.Link do
  require Ecto.Query

  use PineappleIo.Web, :model
  alias PineappleIo.Repo
  alias PineappleIo.Vote
  alias Timex.Date
  alias Ecto.Query

  schema "links" do
    field :title, :string
    field :submitted_on, Ecto.DateTime
    field :rank_score, :float
    field :url, :string
    field :description, :string
    belongs_to :submitter, PineappleIo.User

    has_many :votes, Vote

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

  def set_rank(link) do
    seconds_in_hour = 60.0 * 60.0
    gravity = 1.2
    {_status, date} = Ecto.DateTime.dump(link.submitted_on)

    delta = Date.diff(Date.now, Date.from(date), :secs)
    item_hour_age = delta / seconds_in_hour

    votes =
      Query.join(__MODULE__, :left, [], votes in Vote)
      |> Query.where([link, votes], [id: votes.link_id])
      |> Repo.aggregate(:count, :id)

    if votes > 0 do
      votes = votes - 1
    end

    changeset = changeset(link, %{rank_score: votes / :math.pow(item_hour_age + 2, gravity)})

    case Repo.update(changeset) do
      {:ok, link} ->
        link
      {:error, changeset} ->
        changeset
    end
  end
end
