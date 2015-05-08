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
  profile: "Chain Reaction",
  email: "chain@reaction.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

User.create({
  profile: "Thrice",
  email: "thrice@band.com",
  password: DEFAULT_INSECURE_PASSWORD,
  password_confirmation: DEFAULT_INSECURE_PASSWORD
})

justin = User.find_by_email('jdoshay@gigitt.com')
ha   = User.find_by_email('hdoshay@gigitt.com')

seed_user = justin

#seed_user.gigs.create(event: "Gigitt Launch Party", date: "06-01-2015", band: "thrice", doors: "19:00", showtime: "21:00", age: "21+", price: "8", description: "Rock Your Heart Out!")
#ha.gigs.create(event: "4th of July Festival", date: "07-04-2015", band: "pennywise", doors: "13:00", showtime: "21:00", age: "All Ages", price: "31", description: "Going To Be A Blast!")
