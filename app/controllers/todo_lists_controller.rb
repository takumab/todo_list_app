class TodoListsController < ApplicationController

  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]


  def index
    @todo_lists = TodoList.all
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

    if @todo_list.save
      flash[:notice] = "Your todo list: #{@todo_list.title} has been created."
      redirect_to @todo_list
    else
      flash[:error] = "Your todo list has yet to be created. Try again."
      render 'new'
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to @todo_list, notice: "Todo list updated"
    else
      render 'edit'
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to todo_lists_path, notice: "Todo list successfully deleted"
  end


  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
