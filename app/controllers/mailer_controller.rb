class MailerController < ApplicationController
  before_action :validations, only: [:contact_email]

  def contact_email
    ContactMailer.contact_email.deliver_now
    flash[:notice] = 'Message envoyé'
    redirect_to '/home#contact'
  end

  private

  def validations
    errors = []
    errors << 'Prénom manquant' unless first_name?
    errors << 'Nom manquant' unless last_name?
    errors << 'Email ou confirmation d\'email manquant' unless email?
    errors << 'Les adresses emails ne concordent pas' unless valid_email?
    errors << 'Message vide' unless message?
    unless errors.empty?
      flash[:alert] = errors
      redirect_to '/home#contact'
    end
  end

  def first_name?
    !params[:first_name].empty? ? true : false
  end

  def last_name?
    !params[:last_name].empty? ? true : false
  end

  def email?
    !params[:email].empty? && !params[:email_validation].empty? ? true : false
  end

  def valid_email?
    params[:email] == params[:email_validation] ? true : false
  end

  def message?
    !params[:message].empty? ? true : false
  end
end
