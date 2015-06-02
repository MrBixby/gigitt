FactoryGirl.define do
  factory :band do
    name { Faker::Company.name }
    genre 'genre'
    city { Faker::Address.city }
    zip { Faker::Address.zip }
  end
end
