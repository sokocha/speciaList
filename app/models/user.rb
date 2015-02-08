class User < ActiveRecord::Base
  has_one :contractor
  has_many :listings
  has_many :offers, through: :listings
  has_many :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
