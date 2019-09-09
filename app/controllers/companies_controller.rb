class CompaniesController < ApplicationController
	before_action :set_company, only: [:edit, :update, :show, :destroy]
	skip_before_action :require_admin, only: [:index, :show]

	def index
		if current_user.admin?
			@companies = Company.search(params[:search]).paginate(page: params[:page], per_page: 5).order(:name)
		else
			@companies = current_user.companies
		end
		
	end

	def new
		@company= Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save		  
		  flash[:notice] = "#{@company.name} added "
		  redirect_to companies_path
		else
		  render 'new'
		end
	end

	def update
		if @company.update(company_params)		  
		  flash[:notice] = "Profile of #{@company.name} was  updated"
		  redirect_to company_path(@company)
		else
		  render 'new'
		end
		
	end

	def show
		
	end

	def edit
		
	end

	def destroy
		@company.destroy
		flash[:notice] = "Company and all dependencies deleted"
	    redirect_to companies_path
		
	end

	private

	def set_company
		@company = Company.find(params[:id])
	end
	
	def company_params
		params.require(:company).permit(:name, :user_id)
	end


end