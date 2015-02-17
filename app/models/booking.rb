class Booking < ActiveRecord::Base
  acts_as_commentable

  belongs_to :listing
  belongs_to :offer

  validates :offer_id, presence: true
  acts_as_votable

  after_create :send_new_booking_sms

  after_update :send_out_sms_complete
  # validate :acceptable_status

  # def acceptable_status
  #   status == 'accepted' || status == 'declined' || status == nil
  # end

  def comments
    comment_threads
  end



  def current_originality_rating
    if self.get_upvotes(:vote_scope => 'rate_originality').size > 0
      self.get_likes(:vote_scope => 'rate_originality').sum(:vote_weight) / self.get_upvotes(:vote_scope => 'rate_originality').size
    else
      "no ratings yet"
    end
  end

  def total_votes_cast_on_bookings_originality
    self.get_upvotes(:vote_scope => 'rate_originality').size
  end

  def send_new_booking_sms
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    booking_members = [self.offer.user,self.listing.user]
    booking_members.each do |member|
    # binding.pry
    message = client.messages.create from: '+441706300252', to: member.phone_number, body: "Well Done! #{self.offer.listing.user.first_name} #{self.offer.listing.user.last_name}, meet your #{self.listing.category.name} #{self.offer.user.first_name} #{self.offer.user.last_name}. Both parties have come to agreement at ₦#{self.offer.price}. Enjoy!!! #{self.offer.listing.user.first_name} #{self.offer.listing.user.last_name} when you are satisfied with the work, reply this message with the following format booking#{self.id}#complete. "
    end
  end

  def send_out_sms_complete
    
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

      booking_members = [self.offer.user,self.listing.user]
      booking_members.each do |member|

        message = client.messages.create from: '+441706300252', to: member.phone_number, body: "Congrats on the completion of #{self.listing.title}! Make sure to leave feedback on each other"

    end
  end





end
