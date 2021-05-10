require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio_keys.env')
require 'timecop'



class Sms
  
  def initialize(client = nil)

    @account_sid = ENV["TWILIO_SID"]
    puts @account_sid
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = client || Twilio::REST::Client.new(@account_sid, @auth_token)
    end

  def send
    delivery_time
    @client.messages.create(
      from: ENV["TWILIO_PHONE_NUMBER"],
      to: ENV["MY_PHONE_NUMBER"],
      body: "Your order has been placed and will be delivered by #{@delivery_time}"
    )
  end

  private

  TIME_FORMAT = "%H:%M"
  
  attr_reader :delivery_time
  
  def delivery_time
   @delivery_time = (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
  

end
