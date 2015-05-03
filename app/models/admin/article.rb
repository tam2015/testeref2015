module Admin
  class Article < ActiveRecord::Base
    acts_as_taggable
    has_many :comments, as: :commentable
    has_many :deals
    has_many :pictures    
    accepts_nested_attributes_for :deals

    # to search the last 4 top_articles from a specific category
    def self.top_articles category_name
      category = Admin::Category.find_by(name: category_name)
      deals = category.deals.limit(4).includes(:article).where(articles: {top_deal: false}) if category
      articles = []
      deals.map do |deal|
        articles << deal.article if deal.article
      end
      articles
    end


    # to search the last 4 old_top_articles from a specific category
    # def self.old_top_articles category_name
    #   i = [1,2,3,4]
    #   top_articles = self.top_articles category_name
    #   n = top_articles.first.id
    #   p = i.map {|number| n+ number }
    #   Admin::Article.where("id IN (?)", p)
    # end

    def category_name
      deal = Admin::Deal.find_by(article_id: id)
      category_name = deal.category_name
    end

    def category_count
      category = Admin::Category.find_by(name: category_name)
      category_id= category.id
      deals = Admin::Deal.where(category_id: category_id).count
    end

    def category_articles
      category = Admin::Category.find_by(name: category_name)
      deals = category.deals.includes(:article)
      articles = []
      deals.map do |deal|
        articles << deal.article
      end
      articles
    end

    def previous_article
      article_id = id - 1
      Admin::Article.find_by(id: article_id)
    end

    def next_article
      article_id = id + 1
      Admin::Article.find_by(id: article_id)
    end

  end
end
