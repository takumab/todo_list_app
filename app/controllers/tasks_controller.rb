class TasksController < ApplicationController
  before_action :set_task, except: [:create]

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

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :completed)
  end


end
