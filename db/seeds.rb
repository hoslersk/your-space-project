# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

veronica = User.create(username: "vronnieli", first_name: "Veronica", last_name: "Li", email: "vronnieli@gmail.com", password: "password")

silvana = User.create(username: "silvanagv", first_name: "Silvana", last_name: "G", email: "silvanagv@gmail.com", password: "password")

plaza = Venue.create(host_id: 1, name: "The Plaza", address: "Central Plaza, New York, NY 10000", description: "fancy")

listing1 = Listing.create(venue_id: 1, available_start_date: Time.now, available_end_date: Time.now, available_start_time: Time.now, available_end_time: Time.now)

res = Reservation.create(listing_id: 1, renter_id: 2, start_date: Time.now, end_date: Time.now, start_time: Time.now, end_time: Time.now, comment: "Can I bring my dog?", confirmed: true)

ven = Venue.create(name: "The Crib", host_id: 1, address: "2011 w street", description: "The best place ever")

listing2 = Listing.create(venue_id: 2, available_start_date: Time.now, available_end_date: Time.now, available_start_time: Time.now, available_end_time: Time.now)

res2 = Reservation.create(listing_id: 2, renter_id: 2, start_date: Time.now, end_date: Time.now, start_time: Time.now, end_time: Time.now, confirmed: true)
