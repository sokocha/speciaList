class User < ActiveRecord::Base
  acts_as_voter
  mount_uploader :user_avatar, UserAvatarUploader
  has_one :contractor, dependent: :destroy
  has_many :listings
  has_many :offers, through: :listings
  has_many :bookings, through: :offers
  has_many :comments
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  validates :phone_number, length: {is: 11}



 # attr_accessor :phone_number
  
  
  # before_save :capitalize_content



  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone_number, presence: true
  # validates :address, presence: true
  # validates :phone_number, length:{maximum: 14}
  # validates :phone_number, length:{minimum: 10}
  # validates :phone_number, uniqueness: true
  validates :phone_number,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable#, :authentication_keys => [:phone_number]


  def vote_weights
    @vote_weights ||= offers.map(&:booking).compact.flat_map(&:votes_for).map(&:vote_weight)
  end

  def vote_weight_sum
    vote_weights.sum
  end
  def vote_weight_avg
    (vote_weight_sum.to_f / vote_weights.count).round(2)
  end



  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if phone_number = conditions.delete(:phone_number)
      where(conditions.to_h).where(["lower(phone_number) = :value OR lower(email) = :value", { :value => phone_number.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  # def capitalize_content
  #   self.first_name = self.first_name.capitalize
  #   self.last_name = self.last_name.capitalize
  #   self.address = self.address.capitalize
  # end

  def email_required?
    false
  end
  
  def involved_in?(booking)
    [booking.offer.try(:user), booking.listing.try(:user)].include?(self)
  end

  def votes
    bookings.map do |booking|
      booking.find_votes_for(:vote_scope => 'rate_originality').sum(:vote_weight)
    end
  end

  def total_vote_score
    votes.reduce(:+)
  end

  def average_vote_score
    total_vote_score.to_f / bookings.count
  end

  def active_contractor?
    contractor != nil && contractor.status == 'active'
  end

  def contractor?
    contractor != nil
  end

  def inactive_contractor?
    contractor.try(:status) != 'active'
  end

end
