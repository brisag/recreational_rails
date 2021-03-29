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

  def destroy
    Office.destroy(params[:id])
    redirect_to "/offices"
  end

  def edit
    @office = Office.find(params[:id])
  end

  def update
    office = Office.find(params[:id])
    office.update(office_params)

    office.save
    redirect_to "/offices/#{office.id}"
  end


  private
  def office_params
    params.permit(:name, :capacity, :first_aid)
  end
end
