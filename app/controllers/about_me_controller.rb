class AboutMeController < ApplicationController
  before_action :authenticate, except: :index
  def index
    File.open("config/about_me.txt", "r") do |f|
      @about_me = f.read
    end
  end

  def edit

  	if params[:body]
  		File.open("config/about_me.txt", "w+") do |f|
			  f.write(params[:body])
			end
			@about_me = params[:body]
			redirect_to :about_me
			return
		else
			File.open("config/about_me.txt", "r") do |f|
	      @about_me = f.read
	    end
    	return @about_me
  	end
  end

  private

  def about_me_params
     params.require(:about_me).permit(:body)
   end
end
