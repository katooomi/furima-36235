FactoryBot.define do
  factory :order_address do
   zip_code { '123-4567' }
   prefecture_id { 1 }
   city { '北海道' }
   street { '1-1' }
   building { '一刻館' }
   phone { '09012345678' }
   token {"tok_abcdefghijk00000000000000000"}
  end
end
