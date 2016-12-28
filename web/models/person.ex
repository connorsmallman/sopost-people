defmodule SopostPeople.Person do
  use SopostPeople.Web, :model

  schema "people" do
    field :name, :string
    field :title, :string
    field :locations, :string
    field :avatar, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
      |> cast(params, ~w(name title locations avatar), [])
  end
end
