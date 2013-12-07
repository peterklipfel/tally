# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# USERS
user1 = User.create(email: "user1@example.com", password: "password", password_confirmation: "password")
user2 = User.create(email: "user2@example.com", password: "password", password_confirmation: "password")

#CLIENTS
client1 = Client.create(name: "Bill", user: user1)
client2 = Client.create(name: "Bob", user: user2)
extra_clients = []
5.times do
  extra_clients << Client.create({name: Faker::Name.name, user: user1})
end
5.times do
  extra_clients << Client.create({name: Faker::Name.name, user: user2})
end

#INVOICES
invoice1 = Invoice.create(title: Faker::Lorem.words.join(" "), client: client1)
invoice2 = Invoice.create(title: Faker::Lorem.words.join(" "), client: client2)
extra_invoices = []
extra_clients.sample(5).each do |c|
  3.times do
    extra_invoices << Invoice.create(title: Faker::Lorem.words.join(" "), client: c)
  end
end

#EXPENSES
expenses1 = expenses2 = extra_expenses = []
6.times do
  expenses1 << Expense.create(task: Faker::Company.catch_phrase,
                              time: rand(1..200),
                              rate: rand(10.00..1000.00),
                              invoice: invoice1)
  expenses2 << Expense.create(task: Faker::Company.catch_phrase,
                              time: rand(1..200),
                              rate: rand(10.00..1000.00),
                              invoice: invoice2)
end
extra_invoices.sample(10).each do |i|
  extra_expenses << Expense.create(task: Faker::Company.catch_phrase,
                                   time: rand(1..200),
                                   rate: rand(10.00..1000.00),
                                   invoice: i)
end

#PAYMENTS
expenses1.zip(expenses2).flatten.each do |e|
  Payment.create(amount: rand(1.00..e.time*e.rate))
end
# expenses2.each do |e|
#   Payment.create([{amount: rand(1.00..e.time*e.rate)}])
# end
