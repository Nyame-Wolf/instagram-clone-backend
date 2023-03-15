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

post1 = Post.create!(user: vitor, title: Faker::Lorem.sentence)
post1.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image1.jpg"), filename: "image1.jpg")
posts << post1

post2 = Post.create!(user: mumenya, title: Faker::Lorem.sentence)
post2.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image2.jpg"), filename: "image2.jpg")
posts << post2

post3 = Post.create!(user: tiago, title: Faker::Lorem.sentence)
post3.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image3.jpg"), filename: "image3.jpg")
posts << post3

post4 = Post.create!(user: diego, title: Faker::Lorem.sentence)
post4.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image4.jpg"), filename: "image4.jpg")
posts << post4

post5 = Post.create!(user: aron, title: Faker::Lorem.sentence)
post5.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image5.jpg"), filename: "image5.jpg")
posts << post5

post6 = Post.create!(user: karla, title: Faker::Lorem.sentence)
post6.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image6.jpg"), filename: "image6.jpg")
posts << post6

post7 = Post.create!(user: rodrigo, title: Faker::Lorem.sentence)
post7.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image7.jpg"), filename: "image7.jpg")
posts << post7

post8 = Post.create!(user: raul, title: Faker::Lorem.sentence)
post8.images.attach(io: File.open("#{Rails.root}/app/assets/images/posts/image8.jpg"), filename: "image8.jpg")
posts << post8

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

# Comment Likes
30.times do
  CommentLike.create!(comment: comments.sample, user: users.sample)
end

# Stories
stories = []

story1 = Story.create!(user: vitor)
story1.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story1.jpg"), filename: 'image1.jpg')
stories << story1

story2 = Story.create!(user: mumenya)
story2.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story2.jpg"), filename: 'image2.jpg')
stories << story2

story3 = Story.create!(user: diego)
story3.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story3.jpg"), filename: 'image3.jpg')
stories << story3

story4 = Story.create!(user: tiago)
story4.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story4.jpg"), filename: 'image4.jpg')
stories << story4

story5 = Story.create!(user: aron)
story5.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story5.jpg"), filename: 'image5.jpg')
stories << story5

story6 = Story.create!(user: karla)
story6.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story6.jpg"), filename: 'image6.jpg')
stories << story6

story7 = Story.create!(user: rodrigo)
story7.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story7.jpg"), filename: 'image7.jpg')
stories << story7

story8 = Story.create!(user: raul)
story8.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story8.jpg"), filename: 'image8.jpg')
stories << story8

story9 = Story.create!(user: raul)
story9.image.attach(io: File.open("#{Rails.root}/app/assets/images/stories/story7.jpg"), filename: 'image7.jpg')
stories << story9