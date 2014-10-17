class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @sites = @user.sites
  end

end