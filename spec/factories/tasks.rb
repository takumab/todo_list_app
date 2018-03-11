FactoryBot.define do
  factory :task do
    description "MyText"
    completed false

    association :todo_list
  end
end
