class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @sites = current_user.sites
  end

end