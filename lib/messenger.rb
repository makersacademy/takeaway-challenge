require 'twilio-ruby'

class Messenger
  attr_reader :account_sid, :auth_token, :phone_number
  def initialize twilio_client_class = Twilio::REST::Client
    @account_sid = ENV['twilio_account_sid']
    @auth_token = ENV['twilio_auth_token']
    @phone_number = ENV['twilio_phone_number']

    @client = twilio_client_class.new(@account_sid, @auth_token)
  end

  def send_message(number, message)
    @client.messages.create(
      from: @phone_number,
      to: number,
      body: message)
  end
end
