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
      can :destroy, Listing
      cannot :destroy, Contractor
      cannot :destroy, User
      cannot :destroy, Category

      can :update, Offer
      can :update, Contractor
      can :update, Listing
      cannot :update, Booking
      can :update, User
      cannot :update, Category
      

    else
        # what can non-logged-in users do?
        can :read, :all
    end
    
  end
  

end