FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Name#{n}" }
    sequence(:last_name) { |n| "Lastname#{n}" }
    sequence(:description) { |n| "Description#{n}" }

    password 'password'

    sequence(:email) { |n| "#{first_name}_#{last_name}_#{n}@test.xyx" }

  end
end
