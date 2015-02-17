class Listing < ActiveRecord::Base
  
  mount_uploader :listing_image, ListingImageUploader
  belongs_to :user
  belongs_to :category
  has_many :offers
  has_one :booking

  accepts_nested_attributes_for :offers

  validates :title, presence: true
  validates :budget, presence: true
  validates :description, presence: true
  # validates :image, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  validates :title, length:{minimum: 3 }
  validates :budget, :numericality => { :greater_than_or_equal_to => 1 }
  validates :description, length:{minimum: 10}

  after_create :send_new_listing_sms

  def send_new_listing_sms
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token


    # relevant_contractors_phone_numbers = Contractor.where(category_id: self.category.id).map {|contractor| contractor.user.phone_number}.join(', ')}

    # What is the best way to put the listing id into this sms, so that the listing id remains included in the contractor response? Use REGEXP? 

# SENDS OUT SMS TO ALL CONTRACTORS WITHIN A CATEGORY,EXCEPT THE LISTING CREATOR
    self.category.contractors.each do |contractor|
      # unless contractor.user == self.user
      message = client.messages.create from: '+441706300252', to: contractor.user.phone_number, body: "#{self.user.first_name} #{self.user.last_name} is paying ₦#{self.budget} for a #{self.category.name}. Description: #{self.description}. If interested, reply this message with the following format listing#{self.id}#your_offer_in_naira_here"
      # end 
    end



   
    
# Send active listing status to the creator of the listing
    message = client.messages.create from: '+441706300252', to: self.user.phone_number, body: "#{self.user.first_name}, your listing: #{self.title} for ₦#{self.budget} is now active. You should receive offers from interested contractors shortly" 

  end

  
  


end
