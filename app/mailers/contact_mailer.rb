class ContactMailer < ApplicationMailer
  def contact_email
    mail(to: 'loic@yopmail.com', subject: 'Contact :') 
  end
end
