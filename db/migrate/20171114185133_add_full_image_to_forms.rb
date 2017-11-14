class AddFullImageToForms < ActiveRecord::Migration
  def change
    add_column :forms, :full_image, :string
  end
end
