# frozen_string_literal: true

class ParentPolicy < ApplicationPolicy
  def create?
    @user.parent.blank? && @user.teacher.blank?
  end

  def update?
    @user.parent.present? && @user.parent.id == @record.id
  end

  def destroy?
    @user.admin?
  end
end
