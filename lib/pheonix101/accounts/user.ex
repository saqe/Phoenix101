defmodule Pheonix101.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :dob, :date
    field :join_date, :date
    field :name, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :title, :dob, :join_date])
    |> validate_required([:name, :title])

    # |> validate_date_of_birth()
  end

  # defp validate_date_of_birth(changeset) do
  #   dateofbirth = get_field(changeset, :dob)
  #   IO.inspect(dateofbirth)

  #   if Timex.between?(~D[1980-01-01], Timex.today()) do
  #     changeset
  #   else
  #     add_error(changeset, :dob, "Date of birth is invalid.")
  #   end
  # end
end
