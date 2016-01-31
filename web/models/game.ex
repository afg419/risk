defmodule Risk.Game do
  use Risk.Web, :model

  schema "games" do
    field :title, :string
    belongs_to :player_1, Risk.User
    belongs_to :player_2, Risk.User

    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
