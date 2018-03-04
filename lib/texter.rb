require 'twilio-ruby'
require 'envyable'
Envyable.load('config/env.yml')

class Texter

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SSID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send(number, body)
    @client.api.messages.create(
      from: @twilio_number,
      to: number,
      body: body
    )
  end

  def messages
    @client.api.account.messages.list
  end

end
