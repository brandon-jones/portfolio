require 'rails_helper'

describe Blog do
	let(:blog) {Blog.new(title: 'tested', body: 'testing', tags: 'test, testing, tester')}

	it "should return the right title" do
		expect(blog.title).to eq('tested')
	end

	it "should return the right body" do
		expect(blog.body).to eq('testing')
	end

	it "should return the right tags" do
		expect(blog.tags).to eq('test, testing, tester')
	end

	it "should append the title to the tags" do
		blog.save
		expect(blog.tags).to eq('test, testing, tester, tested')
	end

end