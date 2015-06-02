FactoryGirl.define do
  factory :venue do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    phone { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
