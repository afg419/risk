defmodule Risk.UserTest do
  use Risk.ModelCase

  alias Risk.User

  @valid_attrs %{bio: "some content", email: "some content", losses: 42, name: "some content", wins: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
