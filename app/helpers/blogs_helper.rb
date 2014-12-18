module BlogsHelper
	def format_tags(tags)
		return_tags = []
		tags = tags.split(', ') if tags.class.to_s == 'String'
		tags.each do |tag|
			return_tags << tag if tag.present?
		end
		return "Tags: #{return_tags.join(', ')}" if return_tags.count > 0
		return ''
	end
end
