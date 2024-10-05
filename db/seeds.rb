users = []
10.times do |i|
  users << User.create!(
    email: "user#{i+1}@mail.com",
    password: "password",
    password_confirmation: "password"
  )
end
users = User.all

posts = []
100.times do
  posts << Post.create!(
    user: users.sample,
    content: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

users.each do |user|
  other_users = users.reject { |u| u == user }
  followers_count = rand(1..5)

  other_users.sample(followers_count).each do |follower|
    Follower.create!(user: user, follower: follower)
  end
end


comments = []
100.times do |i|
  comments << Comment.create!(
    content: "This is a comment number #{i+1}",
    user: users.sample,
    post: posts.sample
  )
end

100.times do |i|
  parent_comment = comments.sample
  Comment.create!(
    content: "This is a reply to comment number #{parent_comment.id}",
    user: users.sample,
    comment_id: parent_comment.id,
    post: parent_comment.post
  )
end
