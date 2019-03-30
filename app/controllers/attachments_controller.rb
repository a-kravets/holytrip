class AttachmentsController < ApplicationController
  def new
    @attachment = Attachment.new
  end

  def create
    set_task
    @attachment = Attachment.new(attachment_params)
    @attachment.task = @task
    @attachment.save

    redirect_to trip_tasks_path(task: @task)
  end

  def destroy
    set_attachment
    set_task
    @attachment.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:trip_id])
  end

  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:name, :description, :attachment_url)
  end
end
