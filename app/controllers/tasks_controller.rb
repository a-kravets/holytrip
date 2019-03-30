class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update]

  def index
    set_trip
    @incomplete = Task.find_incomplete(@trip)
    @complete = Task.find_complete(@trip)
    @task = Task.new
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    set_trip
    @task = Task.new(task_params)
    @task.trip = @trip
    @task.user = current_user
    @task.save

    redirect_to trip_tasks_path(@trip)
  end

  def update
    set_task
    set_trip
    if task_params[:done_at]
      @task.update(:done_at => DateTime.now)
    elsif params[:task][:participant].to_i != 0
      user = User.find(params[:task][:participant].to_i)
      @task.update(user: user)
    else
      @task.update!(task_params)
    end

    respond_to do |format|
      format.html {
        redirect_to trip_tasks_path(@trip)
      }
      format.json { render json: @task }
     end
  end

  def destroy
    set_task
    set_trip
    @task.destroy
    redirect_to trip_tasks_path(@trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :done_at)
  end
end
