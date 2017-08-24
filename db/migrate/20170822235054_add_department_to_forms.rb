class AddDepartmentToForms < ActiveRecord::Migration
  def change
    add_column :forms, :department, :string
  end
end
