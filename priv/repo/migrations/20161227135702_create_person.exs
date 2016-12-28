defmodule SopostPeople.Repo.Migrations.CreatePerson do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :title, :string
      add :locations, :string
      add :avatar, :string

      timestamps
    end

    create unique_index(:people, [:name])
  end
end
