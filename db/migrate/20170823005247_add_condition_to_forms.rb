class AddConditionToForms < ActiveRecord::Migration
  def change
    add_column :forms, :condition, :string
  end
end
