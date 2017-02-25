require 'dotenv/load'

class TwilioClient

def initialize
  @client = Twilio::REST::Client.new(
  ENV['SID'],
  ENV['AUTH_TOK']
  )
end

def notify(body)
  @client.messages.create(
  from: ENV['TWIL_NUM'],
  to: ENV['CUST_NUM'],
  body: body
  )
end

end
