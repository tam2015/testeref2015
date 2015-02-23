module Admin

  class Store < ActiveRecord::Base
    has_many :products
    has_many :deals
  end

end
