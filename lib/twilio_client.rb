require 'twilio-ruby'

class TwilioClient

  ACCOUNT_SID = 'AC80bb171e8ce5d212877da1b83da3217d'
  AUTH_TOKEN = '05f2208c68e912c4148120b7b83409df'

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end
end
