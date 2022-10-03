json.extract! employee, :id, :first_name, :father_name, :last_name, :remaining, :employee_id, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
