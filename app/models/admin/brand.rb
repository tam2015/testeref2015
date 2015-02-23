module Admin

  class Brand < ActiveRecord::Base
    has_many :products
    has_many :deals
  end

end
