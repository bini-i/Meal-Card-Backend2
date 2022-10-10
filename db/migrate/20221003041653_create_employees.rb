class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :father_name, null: false
      t.string :last_name, null: false
      t.integer :remaining, default: 0, null: false
      t.string :employee_id, null: false 
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employees, :employee_id
  end
end
