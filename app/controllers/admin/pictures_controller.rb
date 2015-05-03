class Admin::PicturesController < ApplicationController

  def index
    @pictures = Admin::Picture.where(article_id: params[:article_id])
    @picture = Admin::Picture.new
  end

  def new
    @picture = Admin::Picture.new
  end

  def create
    @picture = Admin::Picture.new(picture_params)
    @picture.article_id = params[:article_id]
    if @picture.save
      redirect_to article_pictures_path
    end
  end

  def show
    @picture = Admin::Picture.find params[:picture_id]
  end

  def destroy
    @picture = Admin::Picture.find params[:picture_id]
    if @picture.destroy
      redirect_to article_pictures_path(article_id: params[:article_id])
    else
      redirect_to article_pictures_path(article_id: params[:article_id])
    end
  end

  private


    def picture_params
      params.require(:admin_picture).permit(
        :image,
        :article_id, 
        :title,
        :content
                )
    end
end


