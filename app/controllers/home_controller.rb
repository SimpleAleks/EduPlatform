class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to '/users/edit'
  end
end
