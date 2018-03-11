require 'rails_helper'


RSpec.describe 'Tasks', type: :request do
  let!(:todo_lists) { create_list(:todo_list, 5, title: "My Todo List") }
  let!(:tasks) { create_list(:task, 3, description: 'Some task', completed: false) }
  let(:todo_list_id) { todo_lists.first.id }


  describe '#create' do

    let(:task_params) do
      {
        task: {
          description: 'My first task',
          completed: false
        }
      }
    end

    before { post "/todo_lists/#{todo_list_id}/tasks", params: task_params }

    it "returns 302 status for redirection" do
      expect(response).to have_http_status(302)
    end
  end
end
