class Booking < ActiveRecord::Base
  belongs_to :listing
  belongs_to :offer

  validates :offer_id, presence: true
  


end
