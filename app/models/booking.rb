class Booking < ActiveRecord::Base
  acts_as_commentable

  belongs_to :listing
  belongs_to :offer

  validates :offer_id, presence: true
  acts_as_votable

  def comments
    comment_threads
  end

  def current_originality_rating
    if self.get_upvotes(:vote_scope => 'rate_originality').size > 0
      self.get_likes(:vote_scope => 'rate_originality').sum(:vote_weight) / self.get_upvotes(:vote_scope => 'rate_originality').size
    else
      "no ratings yet"
    end
  end

  def total_votes_cast_on_bookings_originality
    self.get_upvotes(:vote_scope => 'rate_originality').size
  end


end
