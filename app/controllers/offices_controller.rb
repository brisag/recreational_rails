class OfficesController < ApplicationController
  def index
    if params[:search]
      @offices = Office.search_offices(params[:search])
    # elsif params[:search]
    #     @offices = Office.partial_search(params[:search])
    else
      @offices = Office.order_created_at
    end
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
  end

  def create
    office = Office.new(office_params)

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
