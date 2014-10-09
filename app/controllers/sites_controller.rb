class SitesController < ApplicationController
  def show
    @site = Site.find(params[:id])
  end

  def create
  end

  def destroy
  end
end