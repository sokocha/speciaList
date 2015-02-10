class User < ActiveRecord::Base
  has_one :contractor, dependent: :destroy
  has_many :listings
  has_many :offers, through: :listings
  
  
  # before_save :capitalize_content



  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :phone_number, presence: true
  # validates :address, presence: true
  # validates :phone_number, length:{maximum: 14}
  # validates :phone_number, length:{minimum: 10}
  # validates :phone_number, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  # def capitalize_content
  #   self.first_name = self.first_name.capitalize
  #   self.last_name = self.last_name.capitalize
  #   self.address = self.address.capitalize
  # end

  



end
