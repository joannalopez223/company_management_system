defmodule HrsystemWeb.EmployeeApiJSON do
    def index(%{employees: employees}) do
        %{data:
            for(employee <- employees) do
                json_object = %{}
                json_object = Map.put(json_object, :employee_id, employee.employee_id)
                json_object = Map.put(json_object, :first_name, employee.first_name)
                json_object = Map.put(json_object, :last_name, employee.last_name)
                json_object = Map.put(json_object, :date_of_hire, employee.date_of_hire)
                json_object = Map.put(json_object, :department, employee.department)
            end
    }
    end

end