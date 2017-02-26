defmodule PineappleIo.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :submitted_on, :utc_datetime
      add :rank_score, :float
      add :url, :string
      add :description, :string
      add :submitter_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:links, [:submitter_id])

  end
end
