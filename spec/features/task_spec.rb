require 'rails_helper'

RSpec.describe "Task", :type => :feature do
  feature "Task" do
      background do
        @todo_list = create(:todo_list)
        @todo_list_id = @todo_list.id
        @task = FactoryBot.create(:task)
      end

      scenario "Add a task", js: true do
        visit "/todo_lists/#{@todo_list_id}"
        within("form") do
          fill_in 'Descripton', with: 'My first task'
        end
        click_button 'Add task'
        expect(page).to have_content('Your todo list: My First Todo List has been created')
        expect(page).to have_current_path()
      end
  end
end
