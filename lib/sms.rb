require 'singleton'
require 'dotenv/load'
require 'twilio-ruby'

class SMS
  include Singleton

  def initialize
    account_sid = 'AC693a56507999f1a8dc74704465548cfb'
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message   
    @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{Time.new.strftime("%H:%M")}",
    to: ENV["PHONE_NUMBER"], 
    from: "+18705444072")
  end

end
