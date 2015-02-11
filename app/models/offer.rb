class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  has_one :booking

  validates :price, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }
  
  validates :user_id, presence: true
  after_save :create_booking

  validate :acceptable_status


  def acceptable_status
    status == 'accepted' || status == 'declined' || status == nil
  end

 


  def create_booking
    if status == 'accepted'
      @booking = Booking.create(listing_id: listing_id, offer_id: id)
      Offer.where(listing_id: listing_id).where.not(status: 'accepted').update_all(status: 'declined')
      Listing.where(id: listing_id).update_all(status: 'contracted')
    end
  end




end
