require 'rubygems'
require 'twilio-ruby'

class Texter

  SID = 'ACa0a9071c0bbbf6d5d43685563e43c6f7'
  AUTH_TOKEN = '9a47da217ea61d2c2035b4454ebf5224'
  CLIENT = Twilio::REST::Client.new(SID, AUTH_TOKEN)
  TWILIO_NUMBER = '+441637820059'
  MY_NUMBER = '+DONT STEAL MY PHONE NUMBER'

  def initialize
    @to = MY_NUMBER
    @from = TWILIO_NUMBER
    @client = CLIENT
  end

  def send(msg)
    @client.messages.create(
    body: msg,
    from: @from,
    to: @to
    )
  end

end
