FactoryGirl.define do
  factory :band do
    name { Faker::Name.name }
    genre 'genre'
    city { Faker::Address.city }
    zip { Faker::Address.zip }

    factory :band_with_gigs do
      transient do
        gig_count = 5
      end

      after(:create) do |band, evaluator|
        create_list(:gig, evaluator.gig_count, band: band )
      end
    end
  end
end
