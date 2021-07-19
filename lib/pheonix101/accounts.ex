defmodule Pheonix101.Accounts do
  alias Pheonix101.Accounts.User
  alias Pheonix101.Repo

  def create_user(attrs) do
    # %User{}
    Repo.insert(attrs)
    |> IO.inspect()
  end

  @spec get_user(integer) :: User
  def get_user(id) when is_integer(id), do: Repo.get!(User, id)

  @spec user_exists?(integer) :: boolean
  def user_exists?(id) when is_integer(id), do: Repo.get(User, id) != nil
  def delete_user(id) when is_integer(id), do: Repo.delete(%User{id: id}) |> IO.inspect()

  def delete_user(%User{id: _} = user), do: Repo.delete(user) |> IO.inspect()

  # def update_user(id, params) when is_map(params) do
  #   Repo.update!(params)
  # end
end
