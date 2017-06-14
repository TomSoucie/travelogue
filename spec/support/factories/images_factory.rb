FactoryGirl.define do

  factory :image do
    sequence(:description) do |n|
      "LostLake#{n}"
    end

    # url { fixture_file_upload(Rails.root.join("spec", "support", "fixtures", "bikepacking.jpg"), 'image/jpg') }
    url 'https://wpassets.trainingpeaks.com/wp-content/uploads/2016/09/19153513/bikepacking-training-preparation-700x394.jpg'
  end
end
