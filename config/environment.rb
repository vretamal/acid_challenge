# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['MAIL_USERNAME'],
  :password => ENV['MAIL_PASSWORD'],
  :domain => ENV['MAIL_DOMAIN'],
  :address => ENV['MAIL_ADDRESS'],
  :port => ENV['MAIL_PORT'],
  :authentication => :plain,
  :enable_starttls_auto => true
}