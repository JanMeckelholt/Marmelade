# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Sample Category 1A")
Category.create(name: "Sample Category 2B")
Category.create(name: "Sample Category 3C")

Post.create(title: "Sample Post 1", content: "Sample Content 1....adadfadfkkkasdfkke", category_id: 1)
Post.create(title: "Sample Post 2", content: "Sample Content 2....adadfadfkkkasdfkke", category_id: 1)
Post.create(title: "Sample Post 3", content: "Sample Content 3....adadfadfkkkasdfkke", category_id: 2)

