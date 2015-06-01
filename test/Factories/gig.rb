FactoryGirl.define do
  factory :gig do
    event 'test event'
    age 'All Ages'
    price '21'
    description 'test description'
    date Date.today
    doors Time.parse('7:00pm')
    showtime Time.parse('9:00pm')
  end
end
