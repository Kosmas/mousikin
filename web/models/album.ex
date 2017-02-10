defmodule Mousikin.Album do
  use Mousikin.Web, :model

  schema "albums" do
    field :title, :string
    field :year, :string
    field :disc_id, :string
    field :owned, :boolean, default: false
    belongs_to :artist, Mousikin.Artist

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :year, :disc_id, :owned])
    |> validate_required([:title, :year, :disc_id, :owned])
  end
end
