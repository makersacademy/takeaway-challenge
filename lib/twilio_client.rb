require 'dotenv'
require 'twilio-ruby'

class TwilioClient
  def initialize
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @from = ENV['twilio_number']
    @to = ENV['client_number']
  end

  attr_reader :from, :client




  def prepare_sms(timestamp)
    @timestamp = timestamp
    @body_message = "Thank you! Your order was placed and will be delivered before #{timestamp}"
    send_sms(@from, @to, @body_message)
  end

  private

  def send_sms(from_number_string, to_number_string, body_string)
    @client.api.account.messages.create(
      from: from_number_string,
      to: to_number_string,
      body: body_string
    )
  end
end
