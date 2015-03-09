DisqusRails.setup do |config|
  config::SHORT_NAME = ENV["PF_DISQUS_SHORT_NAME"]
  config::SECRET_KEY = ENV["PF_DISQUS_SECRET_KEY"] #leave blank if not used
  config::PUBLIC_KEY = ENV["PF_DISQUS_PUBLIC_KEY"] #leave blank if not used
  config::ACCESS_TOKEN = ENV["PF_DISQUS_ACCESS_TOKEN"] #you got it, right? ;-)
end