# Table name -  features
# A feature belongs to one plan
# Admin can create features on signin
class Feature < ActiveRecord::Base
  belongs_to :plan
  validates :name, presence: true
  validates_numericality_of :limit
end
