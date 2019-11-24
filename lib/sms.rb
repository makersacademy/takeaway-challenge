require_relative 'order'
require_relative 'customer'
require 'twilio-ruby'

class Sms

  attr_reader :client

  def initialize(client = Twilio::REST::Client.new(account_sid, auth_token))
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = client
  end

  def send_sms(message)
    @client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: # @customer.phone_number
      body: message
    )
  end

  puts message.sid
end
