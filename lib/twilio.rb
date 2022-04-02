require 'twilio-ruby'
require 'dotenv/load'

class Twilio
  @@account_sid = ENV['ACCOUNT_SID']
  @@auth_token = ENV['AUTH_TOKEN']  

  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  def send_text(number)
    @client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{one_hour}",
      to: number,
      from: ENV['TWILIO_NUMBER']
    )
  end 

  private

  def one_hour
    time = Time.now + 3600
    time.strftime("%R")
  end
end
