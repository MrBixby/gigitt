# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEFAULT_INSECURE_PASSWORD = 'nomorebs'

user = User.create({
  profile: "Justin",
  email: "jdoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

venue = Venue.create({
  name: "Chain Reaction",
  user_id: user.id
})

slot1 = venue.timeslots.create({
  date: 1.week.from_now,
  start_time: "07:00 PM".to_time,
  end_time: "09:00 PM".to_time,
  openings: 2,
  pay_amount: 100.00,
  paid_gig: true,
  notes: "Looking for great Punk Rock"
})

slot2 = venue.timeslots.create({
  date: 1.week.ago,
  start_time: "07:00 PM".to_time,
  end_time: "09:00 PM".to_time,
  openings: 2,
  pay_amount: 100.00,
  paid_gig: true,
  notes: "Looking for great Punk Rock"
})

slot3 = venue.timeslots.create({
  date: 2.weeks.from_now,
  start_time: "07:00 PM".to_time,
  end_time: "09:00 PM".to_time,
  openings: 2,
  pay_amount: 100.00,
  paid_gig: true,
  notes: "Looking for EDM DJ's"
})

gig1 = slot1.create_gig({
  event: "Punk it up",
  doors: "06:00 PM".to_time,
  showtime: "07:00 PM".to_time,
  age: "21 and Up",
  price: "$15 presale, $20 at the door",
  description: "Punk rock rules!"
})

gig2 = slot2.create_gig({
  event: "Punk it up",
  doors: "06:00 PM".to_time,
  showtime: "07:00 PM".to_time,
  age: "21 and Up",
  price: "$15 presale, $20 at the door",
  description: "Punk rock rules!"
})



justin = User.find_by_email('jdoshay@gigitt.com')
ha   = User.find_by_email('hdoshay@gigitt.com')

seed_user = justin

#seed_user.gigs.create(event: "Gigitt Launch Party", date: "06-01-2015", band: "thrice", doors: "19:00", showtime: "21:00", age: "21+", price: "8", description: "Rock Your Heart Out!")
#ha.gigs.create(event: "4th of July Festival", date: "07-04-2015", band: "pennywise", doors: "13:00", showtime: "21:00", age: "All Ages", price: "31", description: "Going To Be A Blast!")
