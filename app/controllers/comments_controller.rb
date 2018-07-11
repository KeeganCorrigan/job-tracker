class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy, :update, :edit]
  before_action :set_job, only: [:destroy, :update, :edit]


  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      redirect_to job_path(@comment.job)
    else
      flash.now[:alert] = @comment.errors.full_messages.join("<br>").html_safe
      redirect_to job_path(@comment.job)
    end
  end

  def edit

  end

  def update
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "comment updated!"
      redirect_to job_path(@job)
    else
      flash.now[:alert] = @comment.errors.full_messages.join("<br>").html_safe
      redirect_to job_path(@job)
    end
  end

  def destroy
    @comment.destroy

    flash[:success] = "comment deleted!"
    redirect_to job_path(@job)
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_job
    @job = @comment.job
  end

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end
