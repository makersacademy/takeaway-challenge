require 'twilio-ruby'
require 'time'
require 'dotenv'

Dotenv.load 'config.env'

class SmsSender
  attr_reader :account_sid, :auth_token, :client, :from, :to
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = ENV['FROM_PHONE_NUMBER']
    @to = ENV['TO_PHONE_NUMBER']
  end

  def text_confirmation
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before" +
          " #{delivery_time}.")
  end

  private

  def delivery_time
    del_time = Time.now + 3600
    del_time.strftime('%H:%M')
  end

end
