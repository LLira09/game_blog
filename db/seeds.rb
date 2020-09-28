# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Walid", email: "walid@walid.com", password: "12345678")
User.create(username: "jake1", email: "jake1@jake1.com", password: "12345678")

Category.create(name: "FPS")
Category.create(name: "MMO")
Category.create(name: "MOBA")
Category.create(name: "PC")
Category.create(name: "Xbox")
Category.create(name: "Playstation")
Category.create(name: "Nintendo")

Article.create(title: "Article 1", content: "ucas ipsum dolor sit amet darth skywalker mara ben organa vader", user_id: 1)
Article.create(title: "Article 2", content: "ucas ipsum dolor sit amet darth skywalker mara ben organa vader", user_id: 2)
Article.create(title: "Article 3", content: "ucas ipsum dolor sit amet darth skywalker mara ben organa vader", user_id: 3)

ArticleCategory.create(article_id: 1, category_id: 1)
ArticleCategory.create(article_id: 2, category_id: 3)
ArticleCategory.create(article_id: 3, category_id: 2)
