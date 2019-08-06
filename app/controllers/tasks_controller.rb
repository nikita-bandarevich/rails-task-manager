class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # raise
    @task = Task.find(params[:id].to_i)
  end

  def new
    @task = Task.new
  end

  def create
    saved_task = Task.create(task_security)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    @task = Task.find(params[:id].to_i)
    @task.update(task_security)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_security
    params.require(:task).permit(:title, :description, :completed)
  end
end
