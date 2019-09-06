class StaticController < ApplicationController
  def home
  end

  def portfolio
  end

  def contact_email
    ContactMailer.contact_email.deliver_now
    redirect_to root_path
  end
end
