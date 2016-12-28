defmodule SopostPeople.PeopleView do
  use SopostPeople.Web, :view

  def split_locations(locations) do
    locations
      |> String.split(",")
  end

  def render("person.json", %{person: person}) do
    %{
      name: person.name,
      title: person.title,
      locations: person.locations,
      avatar: person.avatar
    }
  end
end
