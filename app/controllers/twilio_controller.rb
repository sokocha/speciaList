require 'twilio-ruby'
 
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
 
  skip_before_action :verify_authenticity_token

 
  def sms
    receiver = params['To']
    sender = params['From']

    body = params['Body'].downcase
    body_array = body.split('#')

    identification = body_array.first
    price_or_response       = body_array.last

    id_array = identification.scan(/\d+|\D+/)

    job_type     = id_array.first
    job_type_id  = id_array.last
    


    # alter receiver phone number to make it from +44 to 07
    if sender.slice!(0..2) == "+234"
      sender = sender.insert(0,'0')


    if job_type == 'listing'
      Offer.create(listing_id: job_type_id, price: price_or_response, user_id: User.find_by(phone_number: sender).id)
    end



    if job_type == 'offer' && price_or_response=='yes' && sender == Offer.find_by(id: job_type_id).listing.user.phone_number

      new_booking = Booking.create(offer_id: job_type_id,listing_id: Offer.find_by(id: job_type_id).listing_id)

      Offer.find_by(id: job_type_id).listing.update(status: 'contracted')

    end



    if job_type == 'booking' && price_or_response == 'complete' && sender == Booking.find_by(id: job_type_id).listing.user.phone_number

      Booking.find_by(id: job_type_id).update(status: price_or_response)

    elsif job_type == 'booking' && price_or_response == 'cancelled'
      Booking.find_by(id: job_type_id).update(status: price_or_response)
    end


  end

end
        

  


end
