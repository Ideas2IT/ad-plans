# Table name -  plans
# Each plan has many features.
# A plan can be subscribed by many users
# Plans and users are related through third model Susbscription
# Signin is required for subscription to a plan
class Plan < ActiveRecord::Base
  has_many :features, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true
  validates_numericality_of :price
end
