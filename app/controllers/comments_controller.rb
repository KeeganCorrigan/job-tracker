class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
