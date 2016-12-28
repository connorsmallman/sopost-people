defmodule SopostPeople.Repo do
  use Ecto.Repo, otp_app: :sopost_people

  def get_by_location(module, location) do
    Enum.filter all(module), fn p -> String.contains?(p.locations, location) end
  end
end
