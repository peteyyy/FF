class User < ActiveRecord::Base
  has_many :actions
  has_many :forms, through: :actions

  validates :city, presence: true
  validates :state, presence: true
  validates :entity, presence: true
  validates :task, presence: true


  validates :employees, on: :update, :inclusion => {:in => [true, false]}
  validates :revenue, on: :update, :inclusion => {:in => [true, false]}
  validates :registered_agent, on: :update, :inclusion => {:in => [true, false]}
  validates :email, on: :update, presence: true
end
