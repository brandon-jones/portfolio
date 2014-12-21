class ManagesController < ApplicationController
	before_action :authenticate
  def index
    
  end

  def rspec
  	render file: '/spec/rspec_results.html', layout: false
  end
end
