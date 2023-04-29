defmodule CompanyMangementSystem.HumanResourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CompanyMangementSystem.HumanResources` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        date_of_hire: ~D[2023-04-21],
        department: "some department",
        employee_id: 42,
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> CompanyMangementSystem.HumanResources.create_employee()

    employee
  end
end
