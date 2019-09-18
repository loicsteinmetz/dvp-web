# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Content.destroy_all
Content.create(name: "hero-1", title: "un site responsive", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Cursus risus at ultrices mi tempus imperdiet.")
Content.create(name: "hero-2", title: "des solutions optimisées", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Cursus risus at ultrices mi tempus imperdiet.")
Content.create(name: "a-propos", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Cursus risus at ultrices mi tempus imperdiet. Nullam eget felis eget nunc lobortis. Purus sit amet luctus venenatis lectus magna fringilla. Diam vulputate ut pharetra sit amet aliquam id.")
Content.create(name: "box-1", title: "création", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.")
Content.create(name: "box-2", title: "intégration", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.")
Content.create(name: "box-3", title: "développement", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.")
Content.create(name: "contact", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.")
Content.create(name: "competences-hero", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Cursus risus at ultrices mi tempus imperdiet.")
Content.create(name: "competences-1", title: "front end", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")
Content.create(name: "competences-2", title: "back end", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")
Content.create(name: "competences-3", title: "gestion de projet / design", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec.")

TimeCv.destroy_all
TimeCv.create(date: "depuis 2019", order: 0)
TimeCv.create(date: "2019", order: 1)
TimeCv.create(date: "2017", order: 2)
TimeCv.create(date: "2016", order: 3)
TimeCv.create(date: "2012", order: 4)

CvEntry.destroy_all
CvEntry.create(date: TimeCv.find_by(date: "depuis 2019"), title: "DUT informatique", sub: "IUT Nancy Charlemagne")
CvEntry.create(date: TimeCv.find_by(date: "depuis 2019"), title: "Développement freelance")
CvEntry.create(date: TimeCv.find_by(date: "2019"), title: "The Hacking Project", sub: "Bootcamp")
CvEntry.create(date: TimeCv.find_by(date: "2017"), title: "Maîtrise de philosophie", sub: "Université Paris-Sorbonne")
CvEntry.create(date: TimeCv.find_by(date: "2016"), title: "Licence de philosophie", sub: "Université Paris-Sorbonne")
CvEntry.create(date: TimeCv.find_by(date: "2012"), title: "Baccalauréat ES", sub: "Mention Très Bien")

Folio.destroy_all
5.times do |n|
  folio = Folio.new(title: "website#{n}", website: "https://website#{n}.com", work: "Lorem ipsum dolor sit amet", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet tellus cras adipiscing enim eu. Lacinia quis vel eros donec. Non odio euismod lacinia at quis risus. Eget nulla facilisi etiam dignissim diam quis enim lobortis. Ut diam quam nulla porttitor massa id. Egestas dui id ornare arcu odio. Nisl nisi scelerisque eu ultrices vitae auctor. Fermentum iaculis eu non diam phasellus vestibulum lorem.", techs: "Ruby, JS, Html, Rails, etc...", description_mini: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", order: n)
  folio.capture.attach(io: open("http://placeimg.com/600/400/any"), filename: 'capture.jpeg')
  folio.save
end