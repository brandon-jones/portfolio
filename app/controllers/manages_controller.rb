class ManagesController < ApplicationController
	before_action :authenticate
  def index
    
  end

  def rspec
  	unless Rails.env == "production"
  		render file: '/spec/rspec_results.html', layout: false and return
  	end
  	redirect manage_path and return
  end
end
