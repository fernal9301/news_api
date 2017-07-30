# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(email: 'u1@mail.ru', password: 'abc123')
user2 = User.create(email: 'u2@mail.ru', password: 'abc123')
user3 = User.create(email: 'u3@mail.ru', password: 'abc123')

news1 = user1.news.create(title: 'title1', content: 'content1')
news2 = user2.news.create(title: 'title2', content: 'content2')
news3 = user3.news.create(title: 'title3', content: 'content3')
