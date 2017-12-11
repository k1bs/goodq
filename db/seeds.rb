# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tootsie = Question.create!(question: 'How many licks does it take to get to the center of a tootsie pop?', score: 3)
woodchuck = Question.create!(question: 'How much wood, yeah, yeah.', score: 2)

Comment.create!(question: tootsie, comment: 'too many', score: 1)
Comment.create!(question: woodchuck, comment: 'a lot', score: 2)
