class AddDetailsToForms < ActiveRecord::Migration
  def change
    add_column :forms, :state, :string
    add_column :forms, :entity, :string
  end
end
