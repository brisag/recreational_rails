class OfficesController < ApplicationController
  def index
    @offices = Office.order_created_at
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
  end

  def create
    office = Office.new(office_params)
      # name: params[:office][:name],
      # capacity: params[:office][:capacity],
      # first_aid: params[:office][:first_aid]
      # })

      office.save
      redirect_to '/offices'
  end

  private

  def office_params
    params.permit(:name, :capacity, :first_aid)
  end
end
