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

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @company = @contact.company
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.full_name} updated!"
      redirect_to company_path(@company)
    else
      flash.now[:alert] = @contact.errors.full_messages.join("<br>").html_safe
      redirect_to company_path(@company)
    end
  end

  def destroy
    company = Company.find(params[:id])
    contact = Contact.find(params[:company_id])
    contact.destroy

    flash[:success] = "#{contact.full_name} was successfully deleted!"
    redirect_to company_path(company)
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position)
  end

end
