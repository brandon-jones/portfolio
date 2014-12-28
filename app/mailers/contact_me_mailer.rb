class ContactMeMailer < ActionMailer::Base
  def contact_me_send_mail(name,email,body)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
