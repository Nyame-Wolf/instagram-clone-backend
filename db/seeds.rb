# Users
users = []

user1 = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
user1.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/vitor.jpg"), filename: 'vitor.jpg')
users << user1
user2 = User.create!(name: 'Mumenya', email: 'mumenya@hotmail.com', password: 123321)
user2.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/nyame.jpg"), filename: 'nyame.jpg')
users << user2

20.times do
  new_user = User.create!(name: Faker::Name.name, email: Faker::Internet.email(domain: 'example'), password: 123321)
  new_user.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/vitor.jpg"), filename: 'vitor.jpg')
  users << new_user
end

# Posts
posts = []

40.times do
  new_post = Post.create!(user: users.sample, title: Faker::Lorem.sentence)
  new_post.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image1.jpg"), filename: 'image1.jpg')
  posts << new_post
end

# Comments
comments = []

80.times do
  comments << Comment.create!(text: Faker::Lorem.sentence, post: posts.sample, user: users.sample)
end

# Likes

80.times do
  Like.create!(post: posts.sample, user: users.sample)
end

