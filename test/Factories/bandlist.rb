FactoryGirl.define do
  factory :bandlist do
    gig
    band

    trait :hired do
      hired true
    end

    factory :bandlist_with_hired_band, traits: [:hired] 
  end

end