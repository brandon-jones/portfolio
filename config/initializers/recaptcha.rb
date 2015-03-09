Recaptcha.configure do |config|
  config.public_key  = ENV["PF_CAPTCHA_SITE_KEY"]
  config.private_key = ENV["PF_CAPTCHA_SECRET_KEY"]
  config.api_version = 'v2'
end