FactoryBot.define do
  factory :review do
    Text { 'Location is not given yet' }
    author_id { User.first.id }
  end
end
