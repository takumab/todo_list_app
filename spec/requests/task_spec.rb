require 'rails_helper'


RSpec.describe 'Tasks', type: :request do
  let!(:todo_list) { FactoryBot.create(:todo_list) }
  let!(:task) { FactoryBot.create(:task) }
  let(:todo_list_id) { todo_list.id }


  describe '#create' do

    let(:task_params) do
      {
        task: {
          description: 'My first task'
        }
      }
    end

    before { post "/todo_lists/#{todo_list_id}/tasks", params: task_params }

    it "returns 302 status for redirection" do
      expect(response).to have_http_status(302)
    end
  end
end
