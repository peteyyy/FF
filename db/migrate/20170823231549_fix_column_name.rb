class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :task, :action
  end
end
