FactoryBot.define do
  factory :item do
    title           {"洋服"}
    text            {"洋服です"}
    category_id        {"5"}
    condition_id       {"4"}
    delivery_fee_id    {"3"}
    prefecture_id      {"2"}
    duration_id       {"5"} 
    price           {9999}

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
