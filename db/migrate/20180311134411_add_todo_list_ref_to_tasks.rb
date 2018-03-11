class AddTodoListRefToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :todo_list, foreign_key: true
  end
end
