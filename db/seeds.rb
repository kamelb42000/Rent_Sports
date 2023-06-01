# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Stuff.destroy_all
Category.destroy_all
User.destroy_all

p "Create Categories"
category = Category.create!(name: 'Football', color: 'FFFFFF')
Category.create!(name: 'Basketball', color: 'FFFF0F')
p category

p "Create user"
User.create!(email: 'toto@gmail.com', password: 'azerty', first_name: 'Toto', last_name: 'Titi')

p "Create Equipment"
p Stuff.create!(name: "Ballon Fifa", category: Category.first, year: "2022", user: User.first, price: "30 euros", description: "Le ballon utilisé pour jouer le dernier carré de la Coupe du monde au Qatar a été présenté ce dimanche 11 décembre. Baptisé Al Hilm ('le rêve '), il est décoré de nuances bordeaux rappelant le drapeau qatari.", address: "10 rue des capucins, Lyon")
# Equipment.create!(name: "Crampons nike CR7", categories_id: second.id, year: "2022", users_id: user.id, price: "55 euros", description: "En janvier 2022, Cristiano Ronaldo est l’un des premiers à apparaitre avec le nouveau coloris de la Mercurial Superfly. Mais plus qu’un simple changement de couleur, Nike a également modifié l’esthétique de la paire avec comme source d’inspiration, les plans de conception des avions et des voitures.")

p "Finito"
