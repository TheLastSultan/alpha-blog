# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create admin
User.create!(
    username: "admin",
    email: "admin@admin.com",
    password: "greathire"
)

# Example seed file I pulled from other website
# 10.times do |blog|
#     Blog.create!(
#         title: BetterLorem.w(rand(4..7),true, true),
#         body: BetterLorem.p(rand(2..5), true, true)
#     )
# end

# puts "10 blog posts created"

# 5.times do |skill|
#     Skill.create!(
#         title: BetterLorem.w(rand(4..7),true, true),
#         percent_utilized: 15
#     )
# end

# puts "5 skills created"

# 9.times do |portfolio_item|
#     Portfolio.create!(
#         title: BetterLorem.w(rand(4..7),true, true),
#         subtitle: BetterLorem.w(rand(3..10),true, true),
#         body: BetterLorem.p(rand(2..5), true, true),
#         main_image: "http://placehold.it/600x400",
#         thumb_image: "http://placehold.it/350x200"
#     )
# end

# puts "9 Portfolios created"