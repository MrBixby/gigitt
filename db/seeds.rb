# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEFAULT_INSECURE_PASSWORD = 'nomorebs'

User.create({
  profile: "Justin",
  email: "jdoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  profile: "Ha",
  email: "hdoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  profile: "Noah",
  email: "ndoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  profile: "Emeri",
  email: "edoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  profile: "Cody",
  email: "cdoshay@gigitt.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

justin = User.find_by_email('jdoshay@gigitt.com')
ha   = User.find_by_email('hdoshay@gigitt.com')
noah  = User.find_by_email('ndoshay@gigitt.com')
emeri  = User.find_by_email('edoshay@gigitt.com')
cody  = User.find_by_email('cdoshay@gigitt.com')

seed_user = justin

seed_user.gigs.create(event: "Gigitt Launch Party", date: "06-01-2015", doors: "19:00", showtime: "21:00", age: "21+", price: "8", description: "Rock Your Hear Out!")
ha.gigs.create(event: "4th of July Festival", date: "07-04-2015", doors: "13:00", showtime: "21:00", age: "All Ages", price: "31", description: "Going To Be A Blast!")
noah.gigs.create(event: "Gigitt New Years Party", date: "12-31-2015", doors: "19:00", showtime: "21:00", age: "21+", price: "10", description: "What A Year!")
emeri.gigs.create(event: "Gigitt Halloween Party", date: "10-31-2015", doors: "19:00", showtime: "21:00", age: "All Ages", price: "16", description: "I Know What I'm Going To Be!")
cody.gigs.create(event: "Gigitt Christmas Eve Party", date: "12-24-2015", doors: "19:00", showtime: "21:00", age: "All Ages", price: "0", description: "Bark Your Heart Out!")
