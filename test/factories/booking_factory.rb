require 'faker'
FactoryBot.define do
  factory :booking do
      sitter
      dog
      date_start { Date.today }
      date_end { Faker::Date.forward(days: 10) }
  end
end
