defmodule Risk.Match do
  use Risk.Web, :model



  schema "matches" do
    field :title, :string
    has_many :match_users, Risk.MatchUser
    has_many :users, through: [:match_users, :user]

    timestamps
  end
end
