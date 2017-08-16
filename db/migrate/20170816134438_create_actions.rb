class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :form, index: true
      t.timestamps null: false
    end
  end
end
