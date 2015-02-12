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

      cannot :create, Offer do |offer|
        offer.listing.try(:user) == user
      end

      can :create, Listing
      cannot :create, Booking 
      cannot :create, User
      cannot :create, Category

      can :destroy, Offer
      
      can :destroy, Listing do |listing|
        listing.try(:user_id) == user.id
      end

      can :update, User do |u|
        u.id == user.id
      end

      cannot :destroy, Contractor
      cannot :destroy, Category
      cannot :destroy, Booking
      


# Only can accept offer if, it's your listing
      can :update, Offer do |offer|
       Listing.where(id: offer.listing_id).map {|listing| listing.user_id}.join(',').to_i == user.id
      end

# Can't create an offer if listing owner equals offers user
      


    

      can :update, Contractor do |contractor|
        contractor.try(:user_id) == user.id
      end

      can :update, Listing do |listing|
        listing.try(:user) == user
      end

      can :update, Booking do |booking|
        Listing.where(id: booking.listing_id).map {|listing| listing.user_id}.join(',').to_i == user.id
      end

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