defmodule Risk.User do
  use Risk.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :wins, :integer
    field :losses, :integer

    timestamps
  end

  @required_fields ~w(name email bio wins losses)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  #changset is like the new method.
  #User.changeset(%User{}, params) is User.new(params)
  #Can ask .valid?, .errors?
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    #|> validate_length(:bio, min: 2)  <-- perform validations here
    #|> validate_format(:email, ~r/@/)
  end
end
