class Offer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user
  has_one :booking

  validates :price, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 1 }
  
  validates :user_id, presence: true
  after_save :create_booking

  validate :acceptable_status
  after_create :send_new_offer_sms

  validate :one_accepted_offer


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

  def one_accepted_offer


  end

  def send_new_offer_sms
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token


    message = client.messages.create from: '+441706300252', to: self.listing.user.phone_number, body: "#{self.user.first_name} #{self.user.last_name} bid ₦#{self.price} on #{self.listing.title}. If you accept the offer, text 'yes' to this number. Reply in the following format: offer#{self.id}#yes or offer#{self.id}#no "
   
    # relevant_client = offer.listing.user.phone_number

    message = client.messages.create from: '+441706300252', to: self.user.phone_number, body: "#{self.user.first_name} #{self.user.last_name} you successfully bid ₦#{self.price} on #{self.listing.title}. Let's hope #{self.listing.user.first_name} hires you!"

  

    
  end




end
