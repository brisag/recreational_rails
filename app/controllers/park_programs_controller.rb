class ParkProgramsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    if params[:alphabet] == "abc_programs"
      @programs = @park.abc_name
    else
      @programs = @park.programs
    #park params[:sort] == "threshold"
    #   @programs = @park.abc_name
    # else
    #   @artists = Artist.all
    end 
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
