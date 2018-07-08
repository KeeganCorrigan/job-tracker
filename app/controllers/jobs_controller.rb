class JobsController < ApplicationController
  def index
    if params[:category]
      cat = Category.where(title: params[:category]).first.id
      flash[:success] = "Now viewing #{params[:category]} jobs"
      @jobs = Job.where(category_id: cat).paginate(:page => params[:page], :per_page => 20)
    else
      @jobs = Job.paginate(:page => params[:page], :per_page => 20).includes(:company)
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@job.company.name}"
      redirect_to job_path(@job)
    else
      flash.now[:alert] = @job.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to job_path(@job)
    else
      flash.now[:alert] = @job.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
