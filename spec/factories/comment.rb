FactoryGirl.define do
  factory :comment do
    sequence(:body) { |n| "Tetsing #{n}" }
    user
    post
  end
end
