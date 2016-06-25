class ArticlesController < ApplicationController
	
	before_action :get_article, only: [:edit,:update,:show,:destroy,:upvote,:downvote]
	before_action :authenticate_user!, except: [:show,:index]

	def index
		if params[:category].blank?
			@articles = Article.all.order("created_at DESC")
		else
			@articles = Article.where(category_id: params[:category]).order("created_at DESC")
		end
	end

	def show
	end

	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(articles_params)
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

	def upvote
		@article.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@article.downvote_by current_user
		redirect_to :back
	end

	private
		def get_article
			@article = Article.find(params[:id])
		end

		def articles_params
			params.require(:article).permit(:title,:content,:category_id)
		end



end
