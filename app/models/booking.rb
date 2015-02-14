class Booking < ActiveRecord::Base
  acts_as_commentable

  belongs_to :listing
  belongs_to :offer

  validates :offer_id, presence: true
  acts_as_votable

  def comments
    comment_threads
  end


end
