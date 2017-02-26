defmodule PineappleIo.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :voter_id, references(:users, on_delete: :nothing)
      add :link_id, references(:links, on_delete: :nothing)

      timestamps()
    end
    create index(:votes, [:voter_id])
    create index(:votes, [:link_id])

  end
end
