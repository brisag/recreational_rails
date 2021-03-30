class ParkProgramsController < ApplicationController
  def index
    @park = Park.find(params[:id])
    if params[:num_of_participants]
      number = params[:num_of_participants]
      @programs = @park.participant_filter(number)
    elsif params[:alphabet] == "abc_programs"
      @programs = @park.abc_name
    else
      @programs = @park.programs
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
