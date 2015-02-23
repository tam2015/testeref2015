module Admin

  class Product < ActiveRecord::Base
    belongs_to :category
    belongs_to :sub_category
    belongs_to :brand
    belongs_to :store
    has_many :deals
  end

end
