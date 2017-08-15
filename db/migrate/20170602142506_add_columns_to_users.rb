class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :revenue, :boolean
    add_column :users, :employees, :boolean
    add_column :users, :registered_agent, :boolean
  end
end
