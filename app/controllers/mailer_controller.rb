class MailerController < ApplicationController
  before_action :validations, only: [:contact_email]

  def contact_email
    if flash[:alert].empty?
      ContactMailer.contact_email(params).deliver_now
      flash[:notice] = 'Message envoyé'
    end

    respond_to do |format|
      format.html do 
        redirect_to '/home#contact'
      end
      format.js {}
    end
  end

  private

  def validations
    errors = []
    errors << 'Prénom manquant' unless first_name?
    errors << 'Nom manquant' unless last_name?
    errors << 'Email ou confirmation d\'email manquant' unless email?
    errors << 'Les adresses emails ne concordent pas' unless valid_email?
    errors << 'Message vide' unless message?
    errors.empty? ? flash[:alert] = [] : flash[:alert] = errors
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
