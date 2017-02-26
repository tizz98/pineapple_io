defmodule PineappleIo.LinkTest do
  use PineappleIo.ModelCase

  alias PineappleIo.Link

  @valid_attrs %{description: "some content", rank_score: "120.5", submitted_on: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Link.changeset(%Link{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Link.changeset(%Link{}, @invalid_attrs)
    refute changeset.valid?
  end
end
