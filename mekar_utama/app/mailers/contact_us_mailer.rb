class ContactUsMailer < ActionMailer::Base
  default :from => "no-replay@gardenice-pvj.com"

  def contact_us_mail_for_admin(contact)
    @contact = contact
    mail(:to => "martin.me15@yahoo.com", :subject => "Question")
  end

  def contact_us_mail(contact, email)
    @contact = contact
    mail(:to => email, :subject => "Question")
  end

  def contact_us_confirmation(contact)
    @contact = contact
    mail(:to => contact.email, :subject => "Thank You")
  end
end
