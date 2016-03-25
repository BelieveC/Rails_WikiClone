class ArticlesController < ApplicationController
	
	before_action :get_article, only: [:edit,:update,:show,:destroy]

	def index
		@articles = Article.all.order("created_at DESC")
	end

	def show
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @article.update(articles_params)
			redirect_to @article
		else 
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_path
	end

	private
		def get_article
			@article = Article.find(params[:id])
		end

		def articles_params
			params.require(:article).permit(:title,:content)
		end



end
