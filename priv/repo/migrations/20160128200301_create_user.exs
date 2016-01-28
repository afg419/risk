defmodule Risk.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :bio, :string
      add :wins, :integer
      add :losses, :integer

      timestamps
    end

  end
end
