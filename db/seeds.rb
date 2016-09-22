# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

f = Fish.new(name: 'nemo', food: 10)
f2 = Fish.new(name: 'dory', food: 15)
f3 = Fish.new(name: 'jaws', food: 20)
f4 = Fish.new(name: 'flipper', food: 25)

f.save
f2.save
f3.save
f4.save

u1 = User.create!(email: "hathbanger.ah@gmail.com", password: "amh05055", password_confirmation: "amh05055")
u2 = User.create!(email: "matthewberryhill@gmail.com", password: "rpm80203", password_confirmation: "rpm80203")

u1.fish << f
u1.fish << f2
u2.fish << f3
u2.fish << f4