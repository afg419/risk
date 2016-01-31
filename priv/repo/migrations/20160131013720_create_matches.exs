defmodule Risk.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:match_users) do
      add :match_id, :integer
      add :user_id, :integer

      timestamps
    end

    create table(:matches) do
      add :title, :string

      timestamps
    end
  end
end
