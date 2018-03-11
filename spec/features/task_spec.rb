require 'rails_helper'

RSpec.describe "Task", :type => :feature do
  feature "Task" do
      background do
        @todo_list = create(:todo_list)
        @todo_list_with_tasks = create(:todo_list_with_tasks).tasks
        #@task = FactoryBot.create(:task)
      end

      scenario "Create a todo list", js: true do
        visit '/todo_lists/show'
        within("form") do
          fill_in 'Descripton', with: 'My first task'
        end
        click_button 'Add task'
        expect(page).to have_content('Your todo list: My First Todo List has been created')
        expect(page).to have_current_path()
      end
  end
end
