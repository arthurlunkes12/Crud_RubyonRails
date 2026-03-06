# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
    return unless user.present?

      if user.admin?
        can :manage, :all
      else
        can :read, Vehicle, status: "available"
        can :rent, Vehicle, status: "available"
        can :cancel, Rental, user_id: user.id
      end
    end
end
