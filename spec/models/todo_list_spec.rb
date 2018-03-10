require 'rails_helper'

RSpec.describe TodoList, type: :model do

  describe "validations" do

    context "when creating new todo list" do
      before(:each) do
        @todo_list = FactoryBot.build(:todo_list, title: 'My todo list')
        @title = TodoList.new(title: ' ')

      end

      it "has not title" do
        expect(@title).not_to be_valid
      end

      it "has a title" do
        expect(@todo_list).to be_valid
      end
    end
  end
end
