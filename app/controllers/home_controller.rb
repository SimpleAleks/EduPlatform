class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    case current_user.user_type
    when 1
      if current_user.parent.blank?
        redirect_to new_parent_path
      else
        redirect_to profile_path
      end
    when 2
      if current_user.teacher.blank?
        redirect_to new_teacher_path
      else
        redirect_to profile_path
      end
    end
  end

  def profile
    redirect_to root_path if current_user.teacher.blank? && current_user.parent.blank?

    @user = current_user
    @user_type_name = current_user.user_type == 1 ? 'parent' : 'teacher'
  end
end
