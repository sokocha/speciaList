class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all

    elsif user.persisted?
      can :read, :all
      can :create, Contractor
      can :create, Offer
      can :create, Listing
      can :create, Booking 
      cannot :create, User
      cannot :create, Category

      can :destroy, Offer
      can :destroy, Listing do |listing|
        listing.try(:user_id) == user.id
      end
      cannot :destroy, Contractor
      cannot :destroy, User
      cannot :destroy, Category



      cannot :update, Offer
    

      can :update, Contractor do |contractor|
        contractor.try(:user_id) == user.id
      end

      can :update, Listing do |listing|
        listing.try(:user_id) == user.id
      end

      cannot :update, Booking

      can :update, User do |u|
        u.id == user.id
      end
      cannot :update, Category
      

    else
        # what can non-logged-in users do?
        can :read, :all
    end
    
  end
  

end