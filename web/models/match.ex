defmodule Risk.Match do
  use Risk.Web, :model

  schema "matches" do
    field :title, :string
    field :current_player, :integer
    field :counter, :integer, default: 0

    has_many :match_users, Risk.MatchUser
    has_many :users, through: [:match_users, :user]

    timestamps
  end

  def next_player(model) do
    user_ids = Enum.map(model.users, fn user -> user.id end)
    current_player = model.current_player
    current_index = Enum.find_index(user_ids, fn id -> id == current_player end)
    Enum.at(user_ids, rem(current_index + 1, Enum.count(user_ids)) )
  end

  @required_fields ~w()
  @optional_fields ~w(title current_player counter)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
