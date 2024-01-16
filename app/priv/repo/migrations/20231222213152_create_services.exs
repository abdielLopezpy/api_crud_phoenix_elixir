defmodule App.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :description, :text
      add :price, :decimal

      timestamps()
    end
  end
end
