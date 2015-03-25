class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
  	authenticate_or_request_with_http_basic do |username, password|
	    if(username == ENV["PF_NAME"] && password == ENV["PF_PASSWORD"])
	    	@admin_only = true
	      true
	    else
	      redirect_to root_path
	    end
  	end
	end

	def red_markdown(words)
		words = '' unless words
		work = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		work.render(words).html_safe
	end
	helper_method :red_markdown

end