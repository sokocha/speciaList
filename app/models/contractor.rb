class Contractor < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  # validates :wage, presence: true
  # validates :user_id, presence: true
  # validates :category_id, presence: true


  # validates :wage, :numericality => { :greater_than_or_equal_to => 1 }
end
