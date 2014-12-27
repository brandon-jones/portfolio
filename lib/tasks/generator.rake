namespace :generator do

	desc "Creates many blogs"
	task :blog_posts => :environment do
		15.times do |i|
			blog = BlogPost.new()
			blog = blog.blog_generator
			# blog = Post.new()
			# blog.title = Faker::Lorem.sentence(Random.rand(5), false, Random.rand(5))
			# blog.body = Faker::Lorem.paragraph(Random.rand(100), false, Random.rand(100))
			blog.save
		end
	end

	desc "Create a few projects"
	task :projects => :environment do
		3.times do |i|
			puts "Creating Project##{i+1}"
			project = Project.new()
			project.title = Faker::Lorem.sentence(Random.rand(5)+1, false, Random.rand(5))
			project.link = Faker::Internet.url
			project.link_text = Faker::Lorem.words(Random.rand(3)+1).join(' ')
			project.tags = Faker::Lorem.words(Random.rand(5)+1).join(', ')
			project.description = Faker::Lorem.paragraph(Random.rand(5)+1, false, Random.rand(5))
			project.details = Faker::Lorem.paragraph(Random.rand(50)+1, false, Random.rand(50))
			project.save
		end
	end

end

class BlogPost

	MAX_BODY_COUNT = 20
	MAX_WHEEL_COUNT = 100
	MAX_TITLE_LENGTH = 5
	MAX_SENTENCE_COUNT = 5
	MAX_LIST_LENGTH = 10
	MAX_WORD_COUNT = 5

	def max_body_count
		return Random.rand(MAX_BODY_COUNT)+1
	end

	def max_wheel_count
		return Random.rand(MAX_WHEEL_COUNT)+1
	end

	def max_title_length
		return Random.rand(MAX_TITLE_LENGTH)+1
	end

	def max_sentence_count
		return Random.rand(MAX_SENTENCE_COUNT)+1
	end

	def max_list_length
		return Random.rand(MAX_LIST_LENGTH)+1
	end

	def max_word_count
		return Random.rand(MAX_WORD_COUNT)+1
	end

	def wheel(int)
		wheel_value.keys.each do |key|
			if int < wheel_value[key] 
				return key
			end
		end
		return 'paragraph'
	end

	def wheel_value
		return {
			'image' => 1,
			'strikethrough' => 3,
			'combined_emphasis' => 8,
			'emphasis' => 14,
			'block_quote' => 18,
			'strong_emphasis' => 24,
			'code' => 32,
			'header' => 45,
			'link' => 60,
			'list' => 75,
			'paragraph' => 100
		}
	end

	def blog_body_generator
		builder = ""
		content_count = max_body_count
		content_count.to_i.times do |content|
			blog_content = wheel(max_wheel_count)
			builder += self.send(blog_content)
			builder += "\n"
		end
		return builder
	end

	def blog_generator
		temp = max_wheel_count
		blog = Blog.new()
		blog.title = Faker::Lorem.sentence(max_title_length, false, max_title_length)
		blog.body = blog_body_generator
		blog.tags = Faker::Lorem.words(max_word_count).join(', ')
		return blog
	end

	def paragraph
		return Faker::Lorem.paragraph(max_sentence_count, false, max_sentence_count) + "\n"
	end

	def list()
		list_type = Random.rand(2)==0 ? "ul" : "ol"
		counter = list_type == "ul" ? 0 : 1
		builder = ""
		max_list_length.times do |count|
			if counter == 0
				builder += "* " + Faker::Lorem.sentence(max_sentence_count, false, max_sentence_count) + "\n"
			else
				builder += "#{counter}. " + Faker::Lorem.sentence(max_sentence_count, false, max_sentence_count) + "\n"
				counter += 1
			end
			if Random.rand(10) == 0
				builder += sublist
			end
		end
		return builder
	end

	def sublist
		list_type = Random.rand(2)==0 ? "ul" : "ol"
		counter = list_type == "ul" ? 0 : 1
		builder = ""
		max_list_length.times do |count|
			if counter == 0
				builder += "  * " + Faker::Lorem.sentence(max_sentence_count/2, false, max_sentence_count) + "\n"
			else
				builder += "  #{counter}. " + Faker::Lorem.sentence(max_sentence_count/2, false, max_sentence_count) + "\n"
				counter += 1
			end
		end
		return builder
	end

	def link
		return "[I'm an inline-style link](https://www.google.com)\n"
	end

	def header
		builder = '#'
		Random.rand(5).times do |t|
			builder += '#'
		end
		builder += " " + Faker::Lorem.sentence(max_word_count) + "\n"
		return builder
	end

	def code
		builder = "```\n"
		(max_list_length+1).times do |d|
			builder += Faker::Lorem.sentence(max_sentence_count) + "\n"
		end
		builder += "```\n"
		return builder
	end

	def block_quote
		return ">" + Faker::Lorem.sentence(max_word_count) + "\n"
	end

	def strong_emphasis
		return Faker::Lorem.sentence(max_word_count) + " _" + Faker::Lorem.sentence(1) + "_ " + Faker::Lorem.sentence(max_word_count) + "\n"
	end

	def emphasis
		return Faker::Lorem.sentence(max_word_count) + " **" + Faker::Lorem.sentence(1) + "** " + Faker::Lorem.sentence(max_word_count) + "\n"
	end

	def combined_emphasis
		return Faker::Lorem.sentence(max_word_count) + " **" + Faker::Lorem.sentence(1) + " _" + Faker::Lorem.sentence(1) + "_** " + Faker::Lorem.sentence(max_word_count) + "\n"
	end

	def strikethrough
		return Faker::Lorem.sentence(max_word_count) + " ~~" + Faker::Lorem.sentence(1) + "~~ " + Faker::Lorem.sentence(max_word_count) + "\n"
	end

	def image
		return "![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 1')\n"
	end
end