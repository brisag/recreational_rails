class OfficeTrailsController < ApplicationController
  def index
    @office = Office.find(params[:id])
  end
end
