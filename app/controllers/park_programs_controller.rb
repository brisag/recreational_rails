class ParkProgramsController < ApplicationController
  def index
    @park = Park.find(params[:id])
  end

  def index_abc
    @park = Park.find(params[:id])
  end

  def new
    @park = Park.find(params[:id])
  end

  def create
    @park = Park.find(params[:id])
    @programs = @park.programs.create!(program_params)
    redirect_to "/parks/#{@park.id}/programs"
  end

  private

  def program_params
    params.permit(:name, :num_of_participants, :virtual)
  end
end
