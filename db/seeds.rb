# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'u@u.com', password: '1234qwer', password_confirmation: '1234qwer', name: 'user')

User.first.complaints.create(title: 'Major Complaint', description: 'A very major complaint', longitude: 1, latitude: 1)
User.first.complaints.create(title: 'Minor Complaint', description: 'A minor complaint', longitude: 1, latitude: 1)
User.first.complaints.create(title: 'A major hackathon mystery', description: 'Whyyyyy Fyyyyyyy', longitude: 1, latitude: 1)