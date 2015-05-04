module Admin::Pictures::PicturesHelper

	def next_image? article, picture 
    	Admin::Picture.find_by(id: picture.id + 1, article_id: article.id)	
	end

	def previous_image? article, picture 
    	Admin::Picture.find_by(id: picture.id.-(1), article_id: article.id)	and
    	picture != article.pictures[1]
	end

end