require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class Notify
  ACCOUNTSID = ENV['ACCOUNTSID']
  AUTH_TOKEN = ENV['AUTHTOKEN']
  FROM_NUMBER = ENV['TWILIO']

  def initialize(twilio_client: Twilio::REST::Client)
    @client = twilio_client.new ACCOUNTSID, AUTH_TOKEN
    @to_number = ENV['PERSONAL']
  end

  def text message, number=@to_number
    @client.messages.create(
      to: number,
      from: FROM_NUMBER,
      body: message
    )
  end
end
