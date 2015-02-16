class Contractor < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  

  validates :wage, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true


  validates :wage, :numericality => { :greater_than_or_equal_to => 1 }
  acts_as_taggable
  validate :certified_not_changed
  validate :verified_not_changed


private
  def certified_not_changed
    if certified_changed? && self.persisted? 
      errors.add(:certified, "Certifications must be presented to a SpeciaList™.")
    end
  end

  def verified_not_changed
    if verified_changed? && self.persisted? 
      errors.add(:verified, "A SpeciaList™ rep must verify your account.")
    end
  end

end
