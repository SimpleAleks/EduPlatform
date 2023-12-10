class ParentsTeachersController < ApplicationController
  before_action :authenticate_user!

  def link
    return redirect_to root_path unless current_user.user_type == 1 && !current_user.parent.blank?

    teacher = Teacher.find params[:id]
    current_user.parent.teachers << teacher if current_user.parent.teachers.where(id: teacher.id).first.blank?
    redirect_to profile_path
  end

  def destroy_link
    return redirect_to root_path unless current_user.user_type == 1 && !current_user.parent.blank?

    current_user.parent.teachers.delete params[:id] unless current_user.parent.teachers.where(id: params[:id]).first.blank?
    redirect_to profile_path
  end
end
