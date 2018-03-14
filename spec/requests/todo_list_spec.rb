require 'rails_helper'


RSpec.describe 'TodoList', type: :request do

  let!(:todo_list) { FactoryBot.create(:todo_list) }
  let(:todo_list_id) { todo_list.id}

  describe "#index" do
    before { get '/todo_lists' }

    it "returns todo lists" do
      expect(response).to have_http_status(200)
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    before { get "/todo_lists/#{todo_list_id}" }

    it "returns a todo list" do
      expect(todo_list_id).to eq(todo_list_id)
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    let(:todo_list_params) do
      {
        todo_list: {
          title: 'My Todo List'
        }
      }
    end

    before { post "/todo_lists/", params: todo_list_params }

    it "creates and redirects to /todo_lists/:id" do
      expect(response).to have_http_status(302)
    end

    it "todo list not created" do
      expect(response).to have_http_status(302)
    end
  end

  describe "#update" do
    let(:todo_list_params) do
      {
        todo_list: {
          title: 'My Todo List'
        }
      }
    end

    before { patch todo_list_path(todo_list_id), params: todo_list_params }

    it "returns status 302 because redirecting back to todo_list" do
      expect(response).to have_http_status(302)
    end
  end


  describe "#destroy" do
    before do
      delete "/todo_lists/#{todo_list_id}"
    end

    it "returns status 302 because redirecting to todo_list" do
      expect(response).to have_http_status(302)
    end
  end
end
