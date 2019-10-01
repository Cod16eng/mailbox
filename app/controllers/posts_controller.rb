class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  skip_before_action :require_admin, only: [:index, :show]

  def index
    
  	if current_user.admin?

      @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: 10).order('received DESC')
    else
      @posts = Post.search(params[:search]).where(company_id: current_user.companies).paginate(page: params[:page], per_page: 10).order('received DESC')
    end
  end
   
   def new
      @post = Post.new
   end
   
   def create
      @post = Post.new(post_params)
      
      if @post.save
      	flash[:notice] = "The #{@post.name} has been uploaded."
         redirect_to posts_path
      else
         render "new"
      end
      
   end

   def edit
     
   end

   def show
     
   end

   def update
    if @post.update(post_params)      
      flash[:notice] = "The#{@post.name} was  updated"
      redirect_to posts_path
    else
      render 'new'
    end
    
  end
   
   def destroy
      
      @post.destroy
      flash[:notice] = "The resume #{@post.name} has been deleted."
      redirect_to posts_path  
   end
   
   private

    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:name, :attachment, :sender, :received, :company_id, :search)
    end
   
end

