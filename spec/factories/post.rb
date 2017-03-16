FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "test{n}" }
    sequence(:body) { |n| "Tetsing #{n}" }
    user
  end
end
