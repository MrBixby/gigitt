FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username 'justin'
    password '12345678'
  end
end
