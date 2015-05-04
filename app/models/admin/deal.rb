module Admin

  class Deal < ActiveRecord::Base
    belongs_to :article
    belongs_to :brand
    belongs_to :store
    belongs_to :product
    belongs_to :category
    belongs_to :sub_category

    # def brand_name
    #   @brand = Admin::Product.find_or_create_by(brand: name)
    # end


    def brand_name
      brand.try(:name)
    end

    def brand_name=(name)
      self.brand = Admin::Brand.find_or_create_by(name: name) #if description.present?
    end

    def store_name
      store.try(:name)
    end

    def store_name=(name)
      self.store = Admin::Store.find_or_create_by(name: name) #if description.present?
    end

    def product_description
      product.try(:description)
    end

    def product_description=(description)
      self.product = Admin::Product.find_or_create_by(description: description) #if description.present?
    end

    def category_name
      category.try(:name)
    end

    def category_name=(name)
      self.category = Admin::Category.find_or_create_by(name: name) #if description.present?
    end

    def sub_category_name
      sub_category.try(:name)
    end

    def sub_category_name=(name)
      self.sub_category = Admin::SubCategory.find_or_create_by(name: name) #if description.present?
    end








  end

end
