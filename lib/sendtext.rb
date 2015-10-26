require 'twilio-ruby'
require 'dotenv'

class SendText
  attr_reader :client, :sid, :token, :twilio_number, :client_number
  Dotenv.load

  def initialize
    @sid = ENV["SID"]
    @token = ENV["TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client_number = ENV['CLIENT_NUMBER']
  end
  
  def send_message(text)
    send_sms(text)
  end

  private

  def send_sms(text)
    @client = Twilio::REST::Client.new(@sid, @token)

    @client.account.messages.create(
    	from: @twilio_number,
    	to: @client_number,
    	body:  text
    )
  end

end
