class ParkProgramsController < ApplicationController
  def index
    @park = Park.find(params[:id])
  end
end
