defmodule SopostPeople.PeopleController do
  use SopostPeople.Web, :controller

  def index(conn, _params) do
    people = Repo.all(SopostPeople.Person)
    render conn, "index.html", people: people
  end

  def show(conn, %{"location" => location}) do
    people = Repo.get_by_location(SopostPeople.Person, location)
    render conn, "show.html", people: people
  end
end
