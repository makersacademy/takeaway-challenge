require 'rubygems'
require 'twilio-ruby'

class Messenger

  def send_text
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to:   ENV['MOBILE_PHONE_NUMBER'],
      body: ["Thanks, we're preparing your order! ",
             "Your rider is Max 👋. ",
             "They will be with you by #{delivery_time.strftime('%H:%M')}"].join
    )
  end

  private

  attr_reader :account_sid, :auth_token

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID'],
    @auth_token = ENV['TWILIO_AUTH_TOKEN'],
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def delivery_time
    Time.now + 2700
  end

end
