class WelcomeController < ApplicationController
	skip_before_action :require_user
	skip_before_action :require_admin
	def index
		
	end
	def need_to_pay
		
	end
end