require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations for sign up" do

    subject { FactoryBot.build(:user) }

    it "has an email" do
      expect(subject).to be_valid
      subject.email = ' '
      expect(subject).to_not be_valid
    end

    it "has a password" do

    end

    it "confirmation pasword" do

    end
  end
end
