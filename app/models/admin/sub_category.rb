module Admin

  class SubCategory < ActiveRecord::Base
    belongs_to :category
    has_many :deals
    has_many :products
  end

end
