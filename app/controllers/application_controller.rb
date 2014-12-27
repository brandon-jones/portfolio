class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate
  	authenticate_or_request_with_http_basic do |username, password|
	    if(username == ENV["PF_NAME"] && password == ENV["PF_PASSWORD"])
	      true
	    else
	      redirect_to root_path
	    end
  	end
	end

	def markdown(words)
		words = '' unless words
		work = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		work.render(words).html_safe
	end

	def process_tags(tags,title)
		return '' unless tags.present?
		tags = tags.split(',').map{ |t| t.strip.downcase }.uniq
		tags << title.downcase if title && tags && title.present? && !tags.include?(title.downcase)
		return tags.join(', ') if tags
		return ''
	end
end