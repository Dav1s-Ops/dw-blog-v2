puts "—————— Clearing existing data..."

User.destroy_all
Category.destroy_all
Tag.destroy_all
Post.destroy_all

puts "—————— Data cleared."
puts "Creating user..."

admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

puts "—————— User created: #{admin.email}"
puts "Creating categories..."

categories = ['Ruby on Rails', 'JavaScript', 'DevOps', 'Tutorials', 'News'].map do |category_name|
  Category.create!(name: category_name)
end

puts "—————— Categories created: #{categories.map(&:name).join(', ')}"
puts "Creating tags..."

tags = ['Beginner', 'Advanced', 'Tips', 'Best Practices', 'Performance'].map do |tag_name|
  Tag.create!(name: tag_name)
end

puts "—————— Tags created: #{tags.map(&:name).join(', ')}"
puts "Creating posts..."

50.times do |i|
  post = Post.create!(
    title: "Sample Post #{i + 1}",
    content: "This is a sample post with **bold text**, _italic text_, and `inline code` #{i + 1}.",
    status: ['draft', 'publish'].sample,
    user: admin
  )

  # Associate random categories and tags
  post.categories << categories.sample(rand(1..3))
  post.tags << tags.sample(rand(1..3))

  # Generate slug using FriendlyId
  post.save!

  puts "Created post: #{post.title}"
end

puts "Data added, happy blogging!"