require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
	let(:title) {RandomData.random_sentence}
	let(:body) {RandomData.random_paragraph}
	let(:price) {RandomData.random_num}
	let(:name) {RandomData.random_sentence}
	let(:description) {RandomData.random_paragraph}

	let(:topic) {Topic.create!(name: name, description: description)}
	let(:my_sponsored_post) {topic.sponsored_posts.create!(title: title, body: body, price: price)}

	describe "attributes" do
		it "has title, body, and price attributes" do
			expect(my_sponsored_post).to have_attributes(title: title, body: body, price: price)
		end
	end
end
