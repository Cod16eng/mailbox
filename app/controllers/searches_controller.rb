class SearchesController < ApplicationController
	def new
	  @search = Search.new
	end

	def create
	  @search = Search.create!(search_params)
	  redirect_to @search
	end

	def show
	  @search = Search.find(params[:id])
	  @posts = Post.paginate(page: params[:page], per_page: 10).order('received DESC')
	end


private
	def search_params
      params.require(:search).permit(:name, :sender, :received, :company_id)
    end
end
