class Ability
  include CanCan::Ability

  def initialize(worker)
    worker ||= Worker.new 
    if worker.has_role?(:admin)
      can :manage, Worker
      can :manage, Role
    end

    if worker.has_role?(:yunying)
      can :manage, Category
      can :manage, Product
      can :manage, City
      can :manage, Price
      can :manage, User
      can :manage, UserCardChargeSetting
      can :manage, CouponList
      can :manage, OrderPromotion
      can :manage, Coupon
    end

    if worker.has_role?(:fenchengshi)
      can :manage, Station
      can :manage, Courier
      can :change_current_city, Worker
      can :manage, PriceRule
      can :manage, Order
    end
  end
end