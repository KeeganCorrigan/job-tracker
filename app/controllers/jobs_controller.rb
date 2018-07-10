class JobsController < ApplicationController
    before_action :set_job, only: [:show, :destroy, :edit, :update]

  def index
    if params[:category]
      cat = Category.where(title: params[:category]).first.id
      flash[:success] = "Now viewing #{params[:category]} jobs"
      @jobs = Job.where(category_id: cat).paginate(:page => params[:page], :per_page => 20)
    elsif params[:location]
      flash[:success] = "Now viewing jobs in #{params[:location]}"
      @jobs = Job.where(city: params[:location]).paginate(:page => params[:page], :per_page => 20)
    elsif params[:sort] = "location"
      @jobs = Job.sort_by_city.paginate(:page => params[:page], :per_page => 20)
    else
      @jobs = Job.paginate(:page => params[:page], :per_page => 20)
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
    @comment = Comment.new
    @job_comments = @job.comments.order(created_at: :desc)
  end

  def edit
  end

  def update
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
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end
end
