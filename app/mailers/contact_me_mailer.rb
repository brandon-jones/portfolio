class ContactMeMailer < ActionMailer::Base
  default from: "ZKForever.am@gmail.com"

  def contact_me_send_mail(name, contact_type, contact_info, body)
    @name = name
    @contact_type = contact_type
    @contact_info = contact_info
    @body = body
    mail(to: "brandon.jones9@gmail.com", subject: "#{@name} has a question")
  end

end