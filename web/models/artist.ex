defmodule Mousikin.Artist do
  use Mousikin.Web, :model

  schema "artists" do
    field :full_name, :string
    field :first_name, :string
    field :last_name, :string

    has_many :albums, Mousikin.Album

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :first_name, :last_name])
    |> validate_required([:full_name])
  end
end
