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

  # trait :with_photo do
  #   photo { fixture_file_upload(Rails.root.join("spec", "support", "fixtures", "bikepacking.jpg"), 'image/jpg') }
  # end
end
