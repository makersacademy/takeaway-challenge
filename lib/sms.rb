require 'twilio-ruby'

class Sms

  ID = "foo" #hidden to push
  KEY = "blahblah" #hidden to push
  SENDER = "null" #hidden to push

  def initialize
    @client = Twilio::REST::Client.new(ID, KEY)
  end

  def send(number, msg)
    @client.messages.create(body: msg, to: number, from: SENDER)
  end

end
