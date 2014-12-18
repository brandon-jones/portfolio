module ApplicationHelper
	def markdown(words)
		work = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		work.render(words).html_safe
	end
end
