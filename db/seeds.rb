# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

veronica = User.create(username: "vronnieli", first_name: "Veronica", last_name: "Li", email: "vronnieli@gmail.com", password: "password")

silvana = User.create(username: "silvanagv", first_name: "Silvana", last_name: "G", email: "silvanagv@gmail.com", password: "password")

# listing1 = Listing.create(venue_id: 1, available_start_date: Time.now, available_end_date: Time.now, available_start_time: Time.now, available_end_time: Time.now)

res = Reservation.create(listing_id: 1, renter_id: 2, start_date: Time.now, end_date: Time.now, start_time: Time.now, end_time: Time.now, comment: "Can I bring my dog?", confirmed: true)

# listing2 = Listing.create(venue_id: 2, available_start_date: Time.now, available_end_date: Time.now, available_start_time: Time.now, available_end_time: Time.now)

res2 = Reservation.create(listing_id: 2, renter_id: 2, start_date: Time.now, end_date: Time.now, start_time: Time.now, end_time: Time.now, confirmed: true)

crib = Venue.create(name: "The Crib", host_id: 1, address: "2011 w street", description: "The best place ever", zip_code: "11223", city: "New York")

plaza = Venue.create(host_id: 1, name: "The Plaza", address: "Central Plaza, New York, NY 10000", description: "fancy", zip_code: "10019", city: "New York")

lowline = Venue.create(host_id: 1, name: "The Lowline", address: "140 Essex St", description: "dark", zip_code: "10002", city: "New York")

highline = Venue.create(host_id: 1, name: "The High Line", address: "439 W 16th St", description: "light", zip_code: "10011", city: "New York")

xian = Venue.create(host_id: 1, name: "Xian's Famous Foods", address: "81 St Marks Pl", description: "light", zip_code: "10003", city: "New York")

unionsq = Venue.create(host_id: 1, name: "Union Square", address: "333 Post St", description: "light", zip_code: "94108", city: "San Francisco")

palazzolavaca = Venue.create(host_id: 1, name: "Palazzo Lavaca", address: "1600 Lavaca St", description: "palatial", zip_code: "78701", city: "Austin")

searstower = Venue.create(host_id: 1, name: "Sears Tower", address: "233 S Wacker Dr", description: "tall", zip_code: "60606", city: "Chicago")

marriott = Venue.create(host_id: 1, name: "JW Marriott Los Angeles L.A. LIVE", address: "900 West Olympic Blvd", description: "luxe", zip_code: "90015", city: "Los Angeles")

loveandpropaganda = Venue.create(host_id: 1, name: "Love and Propaganda", address: "85 Campton Pl", description: "boozy", zip_code: "94108", city: "San Francisco")

shard = Venue.create(host_id: 1, name: "The Shard", address: "32 London Bridge St", description: "Tallest building in the UK", zip_code: "SE1", city: "London")
