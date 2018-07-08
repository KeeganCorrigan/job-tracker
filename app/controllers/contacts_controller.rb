class ContactsController < ApplicationController

  def index
    @contact = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "contact added!"
      redirect_to company_path(@contact.company)
    else
      flash.now[:alert] = @contact.errors.full_messages.join("<br>").html_safe
      redirect_to company_path(@contact.company)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position)
  end

end
