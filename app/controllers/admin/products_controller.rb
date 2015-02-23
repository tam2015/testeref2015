class Admin::ProductsController < ApplicationController

  def index
    @products = Admin::Product.all.order(:description)
    render json: @products.map(&:description)
  end

end
