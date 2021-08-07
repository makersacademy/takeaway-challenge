module SMS
  require 'dotenv/load'
  require 'twilio-ruby'

  account_sid = ENV['twilio_account_sid']
  auth_token = ENV['twilio_auth_token']
  
  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @restaurant = ENV['twilio_mobile_number']
  @customer = ENV['my_mobile_number']

  def self.send(body)
    @client.messages.create(from: @restaurant, to: @customer, body: body)
  end
end