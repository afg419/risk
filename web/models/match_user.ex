defmodule Risk.MatchUser do
  use Risk.Web, :model
  import Ecto.Query

  schema "match_users" do
    belongs_to :user, Risk.User
    belongs_to :match, Risk.Match

    timestamps
  end
end
