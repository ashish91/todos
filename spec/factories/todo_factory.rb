FactoryBot.define do
  factory :todo do
    description { Faker::Lorem.sentence(word_count: 1 + rand(10)) }
  end

  factory :sample_todo, parent: :todo do
  end
end
