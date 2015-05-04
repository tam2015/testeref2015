module Admin::Articles::ArticlesHelper

	def slide_show article 
		article.pictures.count > 1
	end
end
