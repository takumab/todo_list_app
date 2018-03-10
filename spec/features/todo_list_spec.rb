require 'rails_helper'

RSpec.describe "TodoList", :type => :feature do
  feature "Todo List" do
      background do
        @todo_list = FactoryBot.create(:todo_list)
        TodoList.make(title: @todo_list.title)
      end

      scenario "Create a todo list" do
        visit '/todo_list/new'
        within("form") do
          fill_in 'Title', with: 'My First Todo List'
        end
        click_button 'Create Todo List'
        expect(page).to have_content 'Todo List Created'
      end
  end
end
