require 'rails_helper'


RSpec.describe 'TodoList', type: :request do

  let!(:todo_lists) { build_list(:todo_list, 5, title: "My Todo List") }
  let(:todo_list_id) { todo_lists.first.id }

  describe "#index" do
    before { get '/todo_lists' }

    it "returns todo lists" do
      expect(todo_lists.size).to eq(5)
    end

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "#show" do
    before { get "/todo_lists/#{todo_list_id}" }

    it "returns a todo list" do
      expect(todo_lists.first.id).to eq(todo_list_id)
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

    before { post "/todo_lists/#{todo_list_id}", params: todo_list_params }

    it "creates and redirects to /todo_lists/:id" do
      expect(response).to have_http_status(302)
    end

    it "todo list not created" do
      expect(response).to have_http_status(422)
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

    before { put "/todo_lists/#{todo_list_id}", params: todo_list_params }

    it "returns status 200" do
      expect(response).to have_http_status(200)
    end

  end


  describe "#destroy" do
    before do
      delete "/todo_lists/#{todo_list_id}"
    end

    it "returns status 204" do
      expect(response).to have_http_status(204)
    end
  end
end
