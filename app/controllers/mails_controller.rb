class MailsController < ApplicationController
  skip_before_action :require_admin, only: [:index, :show]

  def index
    
  	if current_user.admin?
      @mails = Mail.all
    else
      @mails = Mail.where(company_id: current_user.companies)
    end
  end
   
   def new
      @mail = Mail.new
   end
   
   def create
      @mail = Mail.new(mail_params)
      
      if @mail.save
      	flash[:notice] = "The resume #{@mail.name} has been uploaded."
         redirect_to mails_path
      else
         render "new"
      end
      
   end
   
   def destroy
      @mail = Mail.find(params[:id])
      @mail.destroy
      flash[:notice] = "The resume #{@mail.name} has been deleted."
      redirect_to mails_path  
   end
   
   private
      def mail_params
      params.require(:mail).permit(:name, :attachment, :sender, :received, :company_id)
   end
   
end

