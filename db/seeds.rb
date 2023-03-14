# Users
vitor = User.create!(name: 'Vitor', email: 'vgm_rox@hotmail.com', password: 123321)
vitor.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/vitor.jpg"), filename: 'vitor.jpg')

mumenya = User.create!(name: 'Mumenya', email: 'mumenya@hotmail.com', password: 123321)
mumenya.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/nyame.jpg"), filename: 'nyame.jpg')

tiago = User.create!(name: 'Tiago', email: 'tiago@hotmail.com', password: 123321)
tiago.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/tiago.jpg"), filename: 'tiago.jpg')

diego = User.create!(name: 'Diego', email: 'diego@hotmail.com', password: 123321)
diego.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/diego.jpg"), filename: 'diego.jpg')

karla = User.create!(name: 'Karla', email: 'karla@hotmail.com', password: 123321)
karla.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/karla.jpg"), filename: 'karla.jpg')

rodrigo = User.create!(name: 'Rodrigo', email: 'rodrigo@hotmail.com', password: 123321)
rodrigo.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/rodrigo.png"), filename: 'rodrigo.png')

raul = User.create!(name: 'Raul', email: 'raul@hotmail.com', password: 123321)
raul.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/raul.jpg"), filename: 'raul.jpg')

aron = User.create!(name: 'Aron', email: 'aron@hotmail.com', password: 123321)
aron.image.attach(io: File.open("#{Rails.root}/app/assets/images/users/aron.jpg"), filename: 'aron.jpg')

users = [vitor, mumenya, tiago, diego, karla, rodrigo, raul, aron]

# Posts
posts = []

20.times do
  new_post = Post.create!(user: users.sample, title: Faker::Lorem.sentence)
  new_post.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image1.jpg"), filename: 'image1.jpg')
  posts << new_post
end

# Comments
comments = []

30.times do
  comments << Comment.create!(text: Faker::Lorem.sentence, post: posts.sample, user: users.sample)
end

20.times do
  comments << Comment.create!(text: "Oh my god, Vitor is so beautiful!", post: posts.sample, user: karla)
end

# Likes

60.times do
  Like.create!(post: posts.sample, user: users.sample)
end

# Comment Replies
comment_replies = []

30.times do 
  comment_replies << CommentReply.create!(text: Faker::Lorem.sentence, user: users.sample, comment: comments.sample)
end

30.times do
  CommentLike.create!(comment: comments.sample, user: users.sample)
end
