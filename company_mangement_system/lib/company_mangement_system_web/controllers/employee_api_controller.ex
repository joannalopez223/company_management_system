defmodule CompanyMangementSystemWeb.EmployeeApiController do
  alias CompanyMangementSystem.HumanResources

  use CompanyMangementSystemWeb, :controller

    def index(conn, _params) do
      employees = HumanResources.list_employees()
      render(conn, :index, employees: employees)
    end
end
