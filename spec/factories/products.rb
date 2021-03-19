FactoryBot.define do
  factory :product do
      name                  {'shouhinnmei'}
      description           {'shouhinnsetumei'}
      category_id           {2}
      status_id             {2}
      delivery_fee_id       {2}
      prefecture_id         {2}
      delivery_day_id       {2}
      price                 {12345}
      association :user 
      after(:build) do |product|
        product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
  
end
