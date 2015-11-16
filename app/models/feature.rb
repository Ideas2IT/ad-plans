class Feature < ActiveRecord::Base
  belongs_to :plan
  validates :name, presence: true
  validates_numericality_of :limit
end
