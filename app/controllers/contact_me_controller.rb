class ContactMeController < ApplicationController
  def contact_me_form
    @contact_me = ContactMe.new()
  end

  def send_contact
    if verify_recaptcha
      redirect_to contact_me_path
    else
      redirect_to root_path
    end
    # send email one day
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :tags)
  end
end
