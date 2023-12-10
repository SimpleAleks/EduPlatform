# frozen_string_literal: true

class TeacherPolicy < ApplicationPolicy
  def create?
    @user.parent.blank? && @user.teacher.blank?
  end

  def update?
    @user.teacher.present? && @user.teacher.id == @record.id
  end

  def destroy?
    @user.admin?
  end
end
