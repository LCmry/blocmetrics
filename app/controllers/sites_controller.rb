class SitesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @site = Site.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @site = Site.new
  end

  def create
    @user = User.find(params[:user_id])
    @site = current_user.sites.build(site_params)
    if @site.save
      flash[:notice] = "Site has been added."
      redirect_to @user
    else
      flash[:alert] = "Error saving the site."
      redirect_to new_user_site_path
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @site = Site.find(params[:id])
    if @site.destroy
      flash[:notice] = "Site has been deleted."
      redirect_to @user
    else
      flash[:alert] = "Problem deleting site."
      redirect_to [@user, @site]
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :user_id)
  end
end