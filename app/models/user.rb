class User < ActiveRecord::Base
  has_one :contractor, dependent: :destroy
  has_many :listings
  has_many :offers, through: :listings

 attr_accessor :phone_number
  
  
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
         :rememberable, :trackable, :validatable, :authentication_keys => [:phone_number]

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

  



end
