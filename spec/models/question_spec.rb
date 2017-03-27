require 'rails_helper'

RSpec.describe Question, type: :model do
	let(:question) {Question.create!(title: "New Question Title", body: "New Question Body", resolved: false)}

	describe "attributes" do
		it "has attributes - title" do
			expect(question).to respond_to(:title)
		end
		it "has attributes - body" do
			expect(question).to respond_to(:body)
		end
		it "has attributes - resolved" do
			expect(question).to respond_to(:resolved)
		end
	end
end
