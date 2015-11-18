# Table name -  subscriptions
# A subscription is associated with one user and one plan
# One user can subscribe to many plans
# One plan can be subscribed by many  users
# Signin is required for subscription
class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
end
