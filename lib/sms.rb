require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio_keys.env')

class Sms
  
  def initialize(client = nil)

    @account_sid = ENV["TWILIO_SID"]
    puts @account_sid
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = client || Twilio::REST::Client.new(@account_sid, @auth_token)
    end

  def send
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV["MY_PHONE_NUMBER"],
      body: "Your order has been placed and will be delivered within one hour "
    )
  end

  private


end
