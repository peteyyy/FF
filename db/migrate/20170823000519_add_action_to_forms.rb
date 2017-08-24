class AddActionToForms < ActiveRecord::Migration
  def change
    add_column :forms, :action, :string
  end
end
