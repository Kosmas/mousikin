defmodule Mousikin.AlbumTest do
  use Mousikin.ModelCase

  alias Mousikin.Album

  @valid_attrs %{disc_id: "some content", owned: true, title: "some content", year: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Album.changeset(%Album{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Album.changeset(%Album{}, @invalid_attrs)
    refute changeset.valid?
  end
end
