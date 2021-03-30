class OfficeTrailsController < ApplicationController
  def index
    @office = Office.find(params[:id])
    if params[:sort]
      @trails = Trail.order(name: params[:sort])
    else
      @trails = Trail.all
    end
  end

  def index_abc
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.find(params[:id])
  end

  def create
    @office = Office.find(params[:id])
    @office.trails.create!(trail_params)
    redirect_to "/offices/#{@office.id}/trails"
  end

  private
  def trail_params
    params.permit(:name, :elevation, :dogs_allowed)
  end
end
