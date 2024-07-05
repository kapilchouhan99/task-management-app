FactoryBot.define do
  factory :task do
    title { "My Task" }
    description { "Task description" }
    status { "Backlog" }
    deadline { "2024-12-31" }
    user { create(:user) }
  end
end
