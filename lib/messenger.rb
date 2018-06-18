# frozen_string_literal: true

require 'twilio-ruby'
require 'dotenv/load'

class Messenger
  def initialize
    acc_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new acc_sid, auth_token
  end

  def send(message)
    @client.messages.create(
      to: ENV['MY_PHONE_NUMBER'],
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: message
    )
  end
end
