class ParksController < ApplicationController
  def index
    @parks = Park.order_created_at
  end

  def show
    @park = Park.find(params[:id])
  end
end
