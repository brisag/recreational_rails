class ParksController < ApplicationController
  def index
    if params[:sort] == "num_of_programs"
      @parks = Park.order_by_number_of_programs
    elsif params[:search]
      @parks = Park.search_parks(params[:search])
      if @parks.empty?
        @parks = Park.partial_park(params[:search])
      end
    else
      @parks = Park.order_created_at
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
  end

  def create
    park = Park.new(park_params)
    park.save
    redirect_to '/parks'
  end

  def destroy
    Park.destroy(params[:id])
    redirect_to "/parks"
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params)

    park.save
    redirect_to "/parks/#{park.id}"
  end

  private
  def park_params
    params.permit(:name, :capacity, :permit_required)
  end
end
