class AddColumsToForms < ActiveRecord::Migration
  def change
    add_column :forms, :name, :string
    add_column :forms, :location, :string
    add_column :forms, :thumbnail, :string
  end
end
