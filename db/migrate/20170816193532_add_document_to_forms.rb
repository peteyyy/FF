class AddDocumentToForms < ActiveRecord::Migration
  def change
    add_column :forms, :document, :string
  end
end
