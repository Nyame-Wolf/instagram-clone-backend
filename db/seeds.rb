# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
user1.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/vitor.jpg"), filename: 'vitor.jpg')
user2 = User.create!(name: 'Mumenya', email: 'mumenya@hotmail.com', password: 123321)
user3 = User.create!(name: 'Diego', email: 'diego@hotmail.com', password: 123321)
user4 = User.create!(name: 'Tiago', email: 'tiago@hotmail.com', password: 123321)

post1 = Post.create!(user: user1, title: "Post 1")
post2 = Post.create!(user: user2, title: "Post 2")
post3 = Post.create!(user: user3, title: "Post 3")
post4 = Post.create!(user: user4, title: "Post 4")

post1.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/nike.png"), filename: 'nike.png')
post1.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/nike.png"), filename: 'nike.png')
post2.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/nike.png"), filename: 'nike.png')
post3.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/nike.png"), filename: 'nike.png')
post4.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/nike.png"), filename: 'nike.png')

comment1 = Comment.create!(text: "Comment 1", post: post1, user: user1)
comment2 = Comment.create!(text: "Comment 2", post: post2, user: user2)
comment3 = Comment.create!(text: "Comment 3", post: post3, user: user3)
comment4 = Comment.create!(text: "Comment 4", post: post4, user: user4)

Like.create!(post: post1, user: user1)
Like.create!(post: post1, user: user2)
Like.create!(post: post1, user: user3)
Like.create!(post: post1, user: user4)

Like.create!(post: post2, user: user1)
Like.create!(post: post2, user: user2)
Like.create!(post: post2, user: user3)

Like.create!(post: post3, user: user1)
Like.create!(post: post3, user: user2)

Like.create!(post: post4, user: user1)




