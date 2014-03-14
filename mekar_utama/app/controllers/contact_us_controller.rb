class ContactUsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @contact_us = ContactUs.new
    @contact_us_info = @about_us = Setting.find_by_name(:contact_us)
  end

  def create
      @contact_us = ContactUs.new(params[:contact_us])
      if true
        if true#@contact_us.save
          flash[:notice] = "Your question is already sent!"
          redirect_to contact_us_path
        else
          flash[:error] = "Your question is failed to sent!<br />Please fill all field first"
          render :action => :new
        end
      else
        flash[:error] = "Fill with the valid recaptcha "
        render :action => :new
      end
  end
end
