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
      end
    end
end
