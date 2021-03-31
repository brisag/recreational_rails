class OfficeTrailsController < ApplicationController
  def index
    @office = Office.find(params[:id])
    if params[:elevation]
      number = params[:elevation]
      @trails = @office.elevation_filter(number)
    elsif params[:alphabet] == "abc_trails"
      @trails = @office.abc_name
    else
      @trails = @office.trails
    end
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
