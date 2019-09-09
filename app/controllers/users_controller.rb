class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	skip_before_action :require_admin, only: [:show, :edit, :update]
	def index		
		@users = User.search(params[:search]).paginate(page: params[:page], per_page: 3).order(:username)
	end

	def new
		@user= User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save		  
		  flash[:notice] = "User added #{@user.username}"
		  redirect_to users_path
		else
		  render 'new'
		end
	end

	def update
		if @user.update(user_params)		  
		  flash[:notice] = "Profile of #{@user.username} was  updated"
		  redirect_to user_path(@user)
		else
		  render 'new'
		end
		
	end

	def show
		@users = User.all.order(:username)
		@company = Company.all
	end

	def edit
		
	end

	def destroy
		@user.destroy
		flash[:notice] = "User and all Companies deleted"
	    redirect_to users_path
		
	end

	private

	def set_user
		@user = User.find(params[:id])
	end
	
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
	end
end