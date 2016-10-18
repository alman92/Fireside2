# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all
Comment.destroy_all

Topic.create([
  {name: "Defense"},
  {name: "Energy"},
  {name: "Social Issues"}
  ])

Comment.create([
  {body: "test for Defense", topic_id: 1},
  {body: "test for Energy", topic_id: 2},
  {body: "test for Social Issues", topic_id: 3}
  ])
