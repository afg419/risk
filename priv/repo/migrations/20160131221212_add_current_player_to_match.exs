defmodule Risk.Repo.Migrations.AddCurrentPlayerToMatch do
  use Ecto.Migration

  def change do
    alter table(:matches) do
      add :current_player, :integer
    end
  end
end
