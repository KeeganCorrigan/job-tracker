class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy, :update, :edit]
  before_action :set_company, only: [:destroy, :update, :edit]

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
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "contact updated!"
      redirect_to company_path(@company)
    else
      flash.now[:alert] = @contact.errors.full_messages.join("<br>").html_safe
      redirect_to company_path(@company)
    end
  end

  def destroy
    @contact.destroy

    flash[:success] = "contact deleted!"
    redirect_to company_path(@company)
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_company
    @company = @contact.company
  end

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position, :id)
  end
end
