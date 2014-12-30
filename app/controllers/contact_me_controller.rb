class ContactMeController < ApplicationController
  def contact_me_form
    @contact_me = ContactMe.new()
  end

  def send_contact
    if Rails.env == "development" || verify_recaptcha
      ContactMeMailer.contact_me_send_mail(params["name"], params["contact_type"], params["contact_info"], params["body"]).deliver
      redirect_to contact_me_path
    else
      redirect_to root_path
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :tags)
  end
end
