class ContactMeController < ApplicationController
  def contact_me_form
    # @contact_me = @contact_me if @contact_me

    # @contact_me = nil
  end

  def send_contact
    @verify_recaptcha = verify_recaptcha
    cm = ContactMe.new(params["name"], params["contact_info"], params["body"], @verify_recaptcha)
    @contact_me = cm.validate
    if @contact_me.initialized?
      if @contact_me.errors.count > 0
        render contact_me_form, locals: { contact_me: @contact_me } and return
      else
        flash[:notice] = "Email successfully sent"
        ContactMeMailer.contact_me_send_mail(params["name"], params["contact_type"], params["contact_info"], params["contact_me_body"]).deliver_now
        redirect_to root_path
      end
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :tags)
  end
end
