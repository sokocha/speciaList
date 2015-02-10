class Listing < ActiveRecord::Base
  accepts_nested_attributes_for :offers

  belongs_to :user
  belongs_to :category
  has_many :offers
  has_one :booking

  validates :title, presence: true
  validates :budget, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true

  validates :title, length:{minimum: 3 }
  validates :budget, :numericality => { :greater_than_or_equal_to => 1 }
  validates :description, length:{minimum: 75}
  


end
