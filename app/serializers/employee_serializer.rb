class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :father_name, :last_name, :remaining, :employee_id
  has_one :department
end
