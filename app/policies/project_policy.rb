# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    user == record.user
  end
end
