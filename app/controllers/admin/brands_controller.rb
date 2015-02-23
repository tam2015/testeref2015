class Admin::BrandsController < ApplicationController

  def index
    @brands = Admin::Brand.all.order(:name)
    render json: @brands.map(&:name)
  end

end
