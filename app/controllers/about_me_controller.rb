class AboutMeController < ApplicationController
  def index
    File.open("config/about_me.txt", "r") do |f|
      @about_me = f.read
    end
  end
end
