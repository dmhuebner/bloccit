require 'random_data'

50.times do
	Post.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all

100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

uniquePost = Post.find_or_create_by(title: "New post title", body: "New body of the unique post")
Comment.find_or_create_by(post: uniquePost, body: "Unique comment body for uniquePost")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
