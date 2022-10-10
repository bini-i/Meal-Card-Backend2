class AddSexToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :sex, :string, null: false
  end
end
