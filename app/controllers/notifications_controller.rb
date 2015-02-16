class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
  client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

  message = client.messages.create from: '+441706300252', to: '447534092880', body: 'Learning to send SMS you are.', status_callback: request.base_url + '/twilio/status'

  render plain: message.status
  end

  def status
   # the status can be found in params['MessageStatus']
   
   # send back an empty response
   
   render_twiml Twilio::TwiML::Response.new
   
  end




end