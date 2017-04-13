class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # dummy user (not logged in)
      if user.has_role? :default_renter
        can :manage, Apartment, user_id: user.id #can only edit or delete what they created
        can :read, Apartment #can view all apartments
      end
  end
end
