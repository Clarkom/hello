class Cab < ApplicationRecord
  belongs_to :cab_model
  belongs_to :manager
  has_many :drivers

  validates :license_plate, presence: true
  validates :agreement_number, presence: true

end
