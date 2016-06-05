# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: 'Vince@gmail.com', password: 'qwer')
u2 = User.create(email: 'Guo@gmail.com', password: 'qwer')

u1.records.create(symptom: 'headache', date: '2016-03-12')
u1.records.create(symptom: 'Stomach hurts', date: '2016-06-01')

u2.records.create(symptom: 'feels weird', date: '2016-05-12')
u2.records.create(symptom: 'tired', date: '2016-01-01')
