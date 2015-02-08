class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  has_one :booking

  validates :price, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }
  
  validates :user_id, presence: true
  



end
