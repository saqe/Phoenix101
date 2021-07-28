defmodule Pheonix101.Orders.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :address, :string
    field :dob, :date
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:first_name, :last_name, :email, :phone_number, :address, :dob])
    |> validate_required([:first_name, :last_name, :email, :phone_number, :address, :dob])
  end
end
