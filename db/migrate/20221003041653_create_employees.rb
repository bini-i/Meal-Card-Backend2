class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :father_name
      t.string :last_name
      t.integer :remaining
      t.string :employee_id
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employees, :employee_id
  end
end
