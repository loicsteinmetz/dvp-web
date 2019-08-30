# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Content.destroy_all
5.times do |n|
  Content.create(name: "name#{n}", title: "title#{n}", body: "content#{n}")
end

CvEntry.destroy_all
5.times do |n|
  CvEntry.create(time: "time#{n}", title: "title#{n}", sub: "sub#{n}")
end

Folio.destroy_all
5.times do |n|
  folio = Folio.new(title: "title#{n}", website: "https://website#{n}.com", work: "work", description: "description#{n}", techs: "Ruby, JS, Html", description_mini: "dm number #{n}")
  folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
  folio.save
end