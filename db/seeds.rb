100.times do
  Post.create!(
    content: Faker::Lorem.paragraph(sentence_count: 5)
  )
end
