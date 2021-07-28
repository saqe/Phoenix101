defmodule Pheonix101.OrdersTest do
  use Pheonix101.DataCase

  alias Pheonix101.Orders

  describe "customers" do
    alias Pheonix101.Orders.Customer

    @valid_attrs %{address: "some address", dob: ~D[2010-04-17], email: "some email", first_name: "some first_name", last_name: "some last_name", phone_number: "some phone_number"}
    @update_attrs %{address: "some updated address", dob: ~D[2011-05-18], email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone_number: "some updated phone_number"}
    @invalid_attrs %{address: nil, dob: nil, email: nil, first_name: nil, last_name: nil, phone_number: nil}

    def customer_fixture(attrs \\ %{}) do
      {:ok, customer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_customer()

      customer
    end

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Orders.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Orders.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      assert {:ok, %Customer{} = customer} = Orders.create_customer(@valid_attrs)
      assert customer.address == "some address"
      assert customer.dob == ~D[2010-04-17]
      assert customer.email == "some email"
      assert customer.first_name == "some first_name"
      assert customer.last_name == "some last_name"
      assert customer.phone_number == "some phone_number"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{} = customer} = Orders.update_customer(customer, @update_attrs)
      assert customer.address == "some updated address"
      assert customer.dob == ~D[2011-05-18]
      assert customer.email == "some updated email"
      assert customer.first_name == "some updated first_name"
      assert customer.last_name == "some updated last_name"
      assert customer.phone_number == "some updated phone_number"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_customer(customer, @invalid_attrs)
      assert customer == Orders.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Orders.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Orders.change_customer(customer)
    end
  end
end