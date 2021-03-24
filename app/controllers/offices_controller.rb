class OfficesController < ApplicationController
  def index
    @offices = Office.order_created_at
  end

  def show
    @office = Office.find(params[:id])
  end
end
