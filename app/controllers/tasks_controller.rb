class TasksController < ApplicationController
  before_action :set_task, except: [:create]
  before_action :set_todo_list, only: [:destroy, :completed]

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @task = @todo_list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task created!"
      redirect_to @todo_list
    else
      flash[:error] = "Task was not created!"
      redirect_to @todo_list
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: "Task has been deleted."
  end

  def completed
    @todo_list = TodoList.find(params[:todo_list_id])
    @task = @todo_list.tasks.completed
    redirect_to root_path, notice: "Task completed!"
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end


end
