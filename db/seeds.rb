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
