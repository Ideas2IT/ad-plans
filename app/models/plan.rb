class Plan < ActiveRecord::Base
  has_many :features, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true
  validates_numericality_of :price
end
