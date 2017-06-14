include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :idea do
    sequence(:name) do |n|
      "Trip Idea#{n}"
    end

    description "Next great trip"

    before(:create) do |idea|
      idea.categories << create(:category)
    end
  end

end
