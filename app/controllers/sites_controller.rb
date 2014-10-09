class SitesController < ApplicationController
  def show
    @site = Site.find(params[:id])
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
      redirect_to [@user, @site]
    else
      flash[:error] = "Error saving the site."
      redirect_to :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @site = Site.find(params[:id])
    if @site.destroy
      flash[:notice] = "Site has been deleted."
      redirect_to @user
    else
      flash[:error] = "Problem deleting site."
      redirect_to [@user, @site]
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :user_id)
  end
end