class AboutMeController < ApplicationController
  before_action :authenticate, except: :index
  def index
    File.open("config/about_me.txt", "r") do |f|
      @about_me = f.read
    end
  end

  def edit

  	if params[:about_me]
  		File.open("config/about_me.txt", "w+") do |f|
			  f.write(params[:about_me])
			end
			@about_me = params[:about_me]
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
     params.require(:about_me).permit(:about_me)
   end
end
