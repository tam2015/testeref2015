module Admin

  class Category < ActiveRecord::Base
    has_many :sub_categories
    has_many :deals
    has_many :products
  end

end
