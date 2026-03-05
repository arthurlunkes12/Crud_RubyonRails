# frozen_string_literal: true

class Ability
  include CanCan::Ability

    def initialize(user)
      return unless user.present?

      if user.admin?
        can :manage, :all
      else
        can :read, Vehicle, user_id: user.id
        can :create, Vehicle
        can :update, Vehicle, user_id: user.id
        cannot :destroy, Vehicle
      end
    end
end
