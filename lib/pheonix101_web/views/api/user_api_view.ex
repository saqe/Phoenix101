defmodule Pheonix101Web.UserAPIView do
  use Pheonix101Web, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      title: user.title,
      join_date: user.join_date,
      dob: user.dob
    }
  end

  def render("user_manager.json", %{user: user}) do
    %{
      manager_name: user.name,
      title: user.title,
      joining_date: user.join_date,
      date_of_birth: user.dob
    }
  end
end
