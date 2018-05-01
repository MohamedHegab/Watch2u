class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :seller
      can :manage, Category
      can :manage, SubCategory
      can :manage, Product
    elsif user.has_role? :customer
      can [:show, :index] , Category
      can :read, SubCategory
      can :read, Product
      can :manage, Address, user_id: user.id
      can :manage, Order, customer_id: user.id
      can :manage, OrderProduct
    end
  end
end
