10.times do |i|
  User.create!(
    email: "user#{i+1}@mail.com",      # Легкий для запоминания email, например user1@example.com
    password: "password",            # Пароли вида password1, password2 и т.д.
    password_confirmation: "password"
  )
end

users = User.all
100.times do
  Post.create!(
    user: users.sample,
    content: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

users.each do |user|
  # Выбираем случайных пользователей для подписки
  other_users = users.reject { |u| u == user }
  followers_count = rand(1..5)  # случайное количество подписчиков от 1 до 5

  other_users.sample(followers_count).each do |follower|
    Follower.create!(user: user, follower: follower)
  end
end
