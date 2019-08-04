# Message!
require_relative "../lib/sms_client.rb"
require 'twilio-ruby'

auth_token = ENV.fetch("TWILIO_AUTH_TOKEN")
account_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
ovie_comms = SMSClient.new(account_sid, auth_token)

ovie_comms.set_from_number(ENV.fetch("TWILIO_FROM_NUMBER"))
ovie_comms.set_to_number(ENV.fetch("PERSONAL_MOBILE"))
ovie_comms.send_message("Message")

# api_key => method which returns API key from environment variables?
# api_key_file(file_name) => method which returns api key from file in git ignore?
