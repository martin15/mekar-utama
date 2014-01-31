class ContactUsController < ApplicationController

  def new
    @contact_us =  ContactUs.new
  end

  def create

  end
end
