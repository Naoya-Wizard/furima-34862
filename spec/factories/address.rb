FactoryBot.define do
  factory :record_address do
    postcode {'123-4567'}
    prefecture_id {2}
    municipality {'市'}
    address {'アドレス'}
    buildingname {'建物名'}
    phonenumber {'09011111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
