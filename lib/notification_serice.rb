require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Notificationservice

  def initialize
    Dotenv.load("takeaway_twilio.env")

    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = ENV['from']

  end

  def send_notification(phone_number, message)
    @client.account.messages.create(
      from: @from,
      to: phone_number,
      body: message
    )
  end

end