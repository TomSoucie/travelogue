FactoryGirl.define do

  factory :user do
    name 'Tom'
    password 'tom1858'

    sequence(:email) { |n| "user-#{n}" }
  end

  trait :as_registered do
    role 'registered'
  end

  trait :as_admin do
    role 'admin'
  end
  
end
