class Admin::DealsController < ApplicationController

  def index
  end

  def new
    @deal = Admin::Deal.new
  end

  def create
    @deal = Admin::Deal.create(deal_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def deal_params
      params.require(:admin_deal).permit( :product_id, :brand_id, :category_id, :sub_category_id, :product_description, :brand_name, :store_name ,:category_name, :sub_category_name )
    end

end
