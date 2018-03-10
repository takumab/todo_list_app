require 'rails_helper'

RSpec.describe "TodoList", :type => :feature do
  feature "Todo List" do
      background do
        @todo_list = FactoryBot.create(:todo_list)
        TodoList.make(title: @todo_list.title)
      end
  end
end
