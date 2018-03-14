require 'rails_helper'

RSpec.describe "TodoList", :type => :feature do
  feature "Todo List" do
      background do
        @todo_list = FactoryBot.create(:todo_list)
      end

      scenario "Create a todo list", js: true do
        visit '/todo_lists/new'
        within("form") do
          fill_in 'Title', with: 'My First Todo List'
        end
        click_button 'Create Todo List'
        expect(page).to have_content('Your todo list: My First Todo List has been created')
        expect(page).to have_current_path(todo_list_path(TodoList.last))
      end
  end
end
