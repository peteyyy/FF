class Form < ActiveRecord::Base
  has_many :actions
  has_many :users, through: :actions
end
