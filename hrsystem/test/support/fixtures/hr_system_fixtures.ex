defmodule Hrsystem.HRSystemFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hrsystem.HRSystem` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        date_of_hire: ~D[2023-04-30],
        department: "some department",
        employee_id: 42,
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Hrsystem.HRSystem.create_employee()

    employee
  end
end
