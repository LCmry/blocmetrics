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
    @site = Site.new(site_params)
    if @site.save
      flash[:notice] = "Site has been added."
      redirect_to [@user, @site]
    else
      flash[:error] = "Error saving the site."
      redirect_to :new
    end
  end

  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:name, :user_id)
  end
end