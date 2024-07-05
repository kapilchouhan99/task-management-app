class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :update_status]

  def index
    @tasks = current_user.tasks
  end

  def show
    @task
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @task
  end

  def create
    params = params = task_params.merge({status: 'Backlog'})
    @task = current_user.tasks.build(params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      redirect_to new_task_url
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      redirect_to edit_task_url
    end
  end

  def update_status
    @task.update(status: params[:status]) if @task.status != params[:status]
    respond_to do |format|
      format.js { render inline: 'location.reload();'}
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :deadline)
  end
end
  