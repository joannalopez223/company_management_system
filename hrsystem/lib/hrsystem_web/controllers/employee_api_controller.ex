defmodule HrsystemWeb.EmployeeApiController do
    alias Hrsystem.HRSystem
    
    use HrsystemWeb, :controller
    
    def index(conn, _params) do
        employees = HRSystem.list_employees()
        render(conn, :index, employees: employees)
    end

end