FactoryGirl.define do

  factory :category do
    sequence(:name) { |n| "Trip#{n}" }
  end
end
