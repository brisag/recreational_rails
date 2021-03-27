class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @program.update(program_params)

    @program.save
    redirect_to "/programs/#{@program.id}"
  end

  private
  def program_params
    params.permit(:name, :num_of_participants, :virtual)
  end
end
