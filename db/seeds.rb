# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'factory_bot'
require 'byebug'
include FactoryBot::Syntax::Methods

FactoryBot.find_definitions

# clear all users and sitters before seeding...
Sitter.all.each {|s| s.destroy}
User.all.each {|s| s.destroy}


50.times do
  create(:sitter)
end

25.times do
  create(:dog)
end
