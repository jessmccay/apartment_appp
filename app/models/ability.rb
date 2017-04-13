class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.has_role? :default_renter
        can :read, Apartment
      end
  end
end
