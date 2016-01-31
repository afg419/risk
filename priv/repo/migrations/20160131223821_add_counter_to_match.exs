defmodule Risk.Repo.Migrations.AddCounterToMatch do
  use Ecto.Migration

  def change do
    alter table(:matches) do
      add :counter, :integer, default: 0
    end
  end
end
