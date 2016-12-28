defmodule SopostPeople.PeopleController do
  use SopostPeople.Web, :controller

  alias SopostPeople.Person

  def index(conn, _params) do
    people = Repo.all(SopostPeople.Person)
    render conn, "index.html", people: people
  end

  def show(conn, %{"location" => location}) do
    people = Repo.get_by_location(SopostPeople.Person, location)
    render conn, "show.html", people: people
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    changeset = Person.changeset(%Person{}, params)

    case Repo.insert(changeset) do
      {:ok, person} ->
        render conn, "person.json", person: person
      {:error, changeset} ->
        conn
    end
  end
end
