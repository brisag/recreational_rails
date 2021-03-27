class TrailsController < ApplicationController
  def index
    @trails = Trail.all.true_dogs_allowed
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    @trail = Trail.find(params[:id])
    @trail.update(trail_params)

    @trail.save

    redirect_to "/trails/#{@trail.id}"
  end

  private

  def trail_params
    params.permit(:name, :elevation, :dogs_allowed)
  end
end
