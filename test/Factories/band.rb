FactoryGirl.define do
  factory :band do
    name { Faker::Name.name }
    genre 'genre'
    city { Faker::Address.city }
    zip { Faker::Address.zip }
  end
end
