module ApplicationHelper
	def markdown(words)
		return '' unless words
		work = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		work.render(words).html_safe
	end

	def format_tags(tags)
		return '' unless tags
		return_tags = []
		tags = tags.split(', ') if tags.class.to_s == 'String'
		tags.each do |tag|
			return_tags << tag.downcase if tag.present?
		end
		return "Tags: #{return_tags.join(', ')}" if return_tags.count > 0
		return ''
	end

	def url_with_protocol(url)
		return '' unless url
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def current_page(page)
  	return 'active' if page == params["controller"]
  	return ''
  end
end
