# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Config action mailer with smtp
ActionMailer::Base.smtp_settings = {
  :user_name => ENV['OVH_ADRESS'],
  :password => ENV['OVH_PWD'],
  :domain => 'dvp-web.fr',
  :address => 'ssl0.ovh.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}