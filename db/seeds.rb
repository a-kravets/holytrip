# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Attachment.destroy_all
Participant.destroy_all
Task.destroy_all
Trip.destroy_all
User.destroy_all

jacob = User.new(name: "Jacob", phone: "+19143238695", email: "jacob.coccari@gmail.com", password: "123456", remote_photo_url:"https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/21761557_1496718640397885_2044666486234280426_n.jpg?_nc_cat=109&_nc_ht=scontent-mxp1-1.xx&oh=f993675a7bbeb9f9c16f862e71b58a6b&oe=5D0293D1")
daniel = User.new(name: "Daniel", phone: "+14097182902", email: "danlin2902@yahoo.com", password: "123456", remote_photo_url:"https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/25152155_1505642512838314_8663932422468807295_n.jpg?_nc_cat=108&_nc_ht=scontent-mxp1-1.xx&oh=89d1da59a5d8724c29ce682506afbd5e&oe=5D12F92C")
marco = User.new(name: "Marco", phone: "+39435205976", email: "marco.fun@gmail.com", password: "123456", remote_photo_url:"https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/10968305_10206152156706788_4341868494568522373_n.jpg?_nc_cat=107&_nc_ht=scontent-mxp1-1.xx&oh=bbf887c2409fadb72ec6269fa4f9280e&oe=5D4FC237")
regi = User.new(name: "Regi", phone: "+19143238695", email: "a.coccari@icloud.com", password: "123456", remote_photo_url:"https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-1/c1.0.958.958a/35228508_10216463136918915_7834817047157538816_n.jpg?_nc_cat=106&_nc_ht=scontent-mxp1-1.xx&oh=892d4bf6808d0bc02c6dc9ec4f99d4f3&oe=5D0FB778")
jacob.save
daniel.save
marco.save
regi.save

trip1 = Trip.new(name: "EuroTrip 2019", destination: "Italy", start_date: DateTime.new(2019, 04, 23), end_date: DateTime.new(2019, 04, 30), remote_photo_url: "https://images-na.ssl-images-amazon.com/images/I/91a7hQZChOL._SL1500_.jpg", user: daniel)
trip2 = Trip.new(name: "AsiaTrip", destination: "Thailand", start_date: DateTime.new(2019, 05, 23), end_date: DateTime.new(2019, 05, 30), remote_photo_url: "https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/44496523_1740675516058503_6895123248409739264_n.jpg?_nc_cat=103&_nc_ht=scontent-mxp1-1.xx&oh=b647508542008dc205b064f113464c41&oe=5D1538F8", user: jacob)
trip3 = Trip.new(name: "AmericaTrip", destination: "New York, New York", start_date: DateTime.new(2019, 02, 23), end_date: DateTime.new(2019, 02, 28), remote_photo_url: "https://media.timeout.com/images/105332050/1024/576/image.jpg", user: regi)
trip4 = Trip.new(name: "France Weekend", destination: "France", start_date: DateTime.new(2019, 06, 23), end_date: DateTime.new(2019, 06, 30), remote_photo_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/08/13/14/paris-summer.jpg?w968", user: daniel)

trip1.save
trip2.save
trip3.save
trip4.save

Participant.create(user: jacob, trip: trip1, status: "confirmed", email: jacob.email)
Participant.create(user: regi, trip: trip1, status: "confirmed", email: regi.email)
Participant.create(user: daniel, trip: trip2, status: "confirmed", email: daniel.email)
Participant.create(user: marco, trip: trip2, status: "confirmed", email: marco.email)
Participant.create(user: daniel, trip: trip3, status: "confirmed", email: daniel.email)
Participant.create(user: marco, trip: trip3, status: "confirmed", email: marco.email)
Participant.create(user: daniel, trip: trip4, status: "confirmed", email: daniel.email)
Participant.create(user: marco, trip: trip4, status: "confirmed", email: marco.email)

task_array = ["look for best free tours", "book your plane tickets", "book the hostel", "book hotel for first night", "buy museum tickets", "make sure your passport is valid", "get visa approved", "buy adapters for locale", "look for daytime activities", "check nightlife", "rent car", "book hotel for last night", "call ahead for reservations at restaurant", "buy tickets for church entry", "buy match tickets", "put activities in calendar", "find store to buy cheap gifts", "research events going on"]

task_array.each do |task|
  trip = Trip.all.sample
  user = Participant.where(trip_id: trip.id).all.sample.user
  task = Task.create(name: task, description: "please get this done", user: user, trip: trip, due_date: trip.start_date, done_at: trip)
  user.save
end

Attachment.create(name: "Yellow Hostel", task: Task.all.sample, description: "hostel purchased", remote_photo_url: "https://i.ytimg.com/vi/YQM0MdvrFW0/maxresdefault.jpg")
Attachment.create(name: "Return Flights", task: Task.all.sample, description: "booked flights", remote_photo_url: "https://everybodyhatesatourist.net/wp-content/uploads/2015/06/american-reservation-codeshare.png")
Attachment.create(name: "duomo", task: Task.all.sample, description: "bought duomo tickets", remote_photo_url: "https://i.ytimg.com/vi/YQM0MdvrFW0/maxresdefault.jpg")
Attachment.create(name: "Hostel Milan", task: Task.all.sample, description: "hostel booked", remote_photo_url: "https://www.yogawinetravel.com/wp-content/uploads/2016/05/Florence-Italy-Duomo-ticket.jpg")
