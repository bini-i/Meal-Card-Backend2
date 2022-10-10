require "csv"

def seed_employees
  puts "Seeding employees..."
  csv = CSV.read("./db/data/employees.csv")
  
  csv.each do |row|
    employee_information = {
      employee_id: row[0],
      first_name: row[1].split[0],
      father_name: row[1].split[1],
      last_name: row[1].split[2],
      sex: row[2],
      department_id: Department.find_by(department_name: row[3]).id
    }
    inv = Employee.create(employee_information)
  end
  puts 'Seeding employees done.'
end
