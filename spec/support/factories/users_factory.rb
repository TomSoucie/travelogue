FactoryGirl.define do

  factory :user do
    name 'Tom'
    password 'tom1858'

    sequence(:email) { |n| "user#{n}" }
  end
end
