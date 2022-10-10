require "csv"

def seed_departments
  puts "Seeding departments..."
  # f = File.new(csv_file_path, 'r')
  csv = CSV.read("./db/data/departments.csv")
  
  csv.each do |row|
    department_information = {
      id: row[0],
      department_name: row[1]
    }
    inv = Department.create(department_information)
  end
  puts 'Seeding departments done.'
end