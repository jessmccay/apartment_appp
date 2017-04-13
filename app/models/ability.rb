class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :broker
        can :manage, Apartment
      elsif user.has_role? :renter
        can :read, Apartment
      end
  end
end
