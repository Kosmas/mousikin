defmodule Mousikin.Repo.Migrations.CreateAlbum do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :year, :string
      add :disc_id, :string
      add :owned, :boolean, default: false, null: false
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end
    create index(:albums, [:artist_id])

  end
end
