class Admin::ArticlesController < ApplicationController

  def index
    @articles = Admin::Article.all.limit(15)
    # if query[:params]
    # end
  end

  def new
    @article = Admin::Article.new
    @deal = @article.deals.new
  end

  def create
    if @article = Admin::Article.create(article_params)
      redirect_to article_pictures_path(article_id: @article.id)
    end
  end

  def show
    @article = Admin::Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def category
    if params[:tag]
      @articles = Admin::Article.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 6)
    elsif  params[:query]
      @articles = Admin::Article.where("title ilike :q or content ilike :q", q: "%#{params[:query]}%").paginate(page: params[:page], per_page: 6)
    else
      @articles = Admin::Article.all.paginate(page: params[:page], per_page: 6)
    end
  end


  private

    def article_params
      params.require(:admin_article).permit( :title, :content, :tag_list, deals_attributes: [:brand_name, :product_description, :category_name, :store_name] )
    end

end