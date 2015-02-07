class User < ActiveRecord::Base
  has_one :contractor
  has_many :listings
  has_many :offers, through: :listings
  has_many :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
