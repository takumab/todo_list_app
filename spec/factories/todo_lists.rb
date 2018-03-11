FactoryBot.define do
  factory :todo_list do
    title "MyString"

    # Creates tasks data after todo_list has been created
    factory :todo_list_with_tasks do
      # tasks_count is declared as a temporary attribute and available
      # in attributes on the factory...
      transient do
        tasks_count 5
      end

      after(:create) do |todo_list, evaluator|
        create_list(:task, evaluator.tasks_count, todo_list: todo_list)
      end
    end
  end
end
