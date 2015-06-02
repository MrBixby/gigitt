FactoryGirl.define do
  factory :gig do
    event 'test event'
    age 'All Ages'
    price { Faker::Commerce.price }
    description 'test description'
    date Time.zone.today
    doors Time.parse('7:00pm')
    showtime Time.parse('9:00pm')
    is_final false

    factory :gig_with_bands do
      association :bands, factory: :band
    end
  end
end
