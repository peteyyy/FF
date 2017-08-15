class User < ActiveRecord::Base
  validates :city, presence: true
  validates :state, presence: true
  validates :entity, presence: true
  validates :task, presence: true


  validates :employees, on: :update, presence: true
  validates :revenue, on: :update, presence: true
  validates :registered_agent, on: :update, presence: true
  validates :email, on: :update, presence: true
end
