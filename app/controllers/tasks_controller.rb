class TasksController < ApplicationController
  before_action :set_task, except: [:create]
  before_action :set_todo_list

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @task = @todo_list.tasks.new(task_params)
    if @task.save
      logger.debug "Task is saved"
      flash[:notice] = "Task created!"
      redirect_to @todo_list
    else
      flash[:error] = "Task was not created!"
      redirect_to @todo_list
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Task has been deleted."
  end

  def completed
    @task.update_attributes(:completed, true)
    redirect_to root_path, notice: "Task completed!"
  end

  private

  def set_task
    @task = @todo_list.tasks.find(params[:id])

  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def task_params
    params.require(:task).permit(:description)
  end


end
