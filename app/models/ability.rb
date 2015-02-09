class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all

    elsif user.persisted?
      can :read, :all
      

    else
        # what can non-logged-in users do?
        can :read, :all
    end
    
  end
  

end