FactoryGirl.define do

  factory :user do
    name 'Tom'
    password 'tompassw'

    sequence(:email) { |n| "user-#{n}@user.com" }
  end

  trait :as_registered do
    role 'registered'
  end

  trait :as_admin do
    role 'admin'
  end

end
