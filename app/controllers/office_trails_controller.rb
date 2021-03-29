class OfficeTrailsController < ApplicationController
  def index
    @office = Office.find(params[:id])
    if !params[:sort].nil?
      @trails = @office.trails.order_abc
    end
    # if params[:sort]
    #   @offices = @office.trails.order_abc
    # else
    #   @offices = Office.all
    # end
    # if !params[:number].nil?
    #   @trails = @office.trails
    # else
    #   params[:number]
    #   number = params[:number]
    #   @trails = @office.trails.elevation_greater_than(number)
    # end
  end

  if params[:sort]
      @artists = Artist.order(name: params[:sort])
    else
      @artists = Artist.all
    end

  # def index_abc
  #   @office = Office.find(params[:id])
  # end

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
