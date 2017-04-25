class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # dummy user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :default_renter
        can :create, Apartment, user_id: user.id #can only edit or delete what they created
        can :update, Apartment, user_id: user.id #can only edit or delete what they created
        can :delete, Apartment, user_id: user.id #can only edit or delete what they created
        can :read, Apartment #can view all apartments
      end
  end
end
