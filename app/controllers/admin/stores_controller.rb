class Admin::StoresController < ApplicationController

  def index
    @stores = Admin::Store.all.order(:name)
    render json: @stores.map(&:name)
  end

end
