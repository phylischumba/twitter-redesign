FactoryBot.define do
  factory :following do
    follower_id { User.first.id}
    followed_id { User.last.id}
  end
end