class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy, :edit, :update]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      flash.now[:alert] = @company.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def show
    @contact = Contact.new
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to companies_path
    else
      flash.now[:alert] = @company.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @company.destroy

    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
