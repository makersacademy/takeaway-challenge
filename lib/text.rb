require_relative 'order'
require 'twilio-ruby'

class Text

  attr_accessor :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
    #send_text
    puts "Thank you for your order. Estimated delivery time will be texted to #{@phone_number}."
  end

private
def send_text
  account_sid = "AC067d5602903fba0cde581de4ceefc0e1"
  auth_token = "759fa30a45cc32f6860bb17d8176010e"
  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Thank you for your order.  Our 1 hour delivery means you should receive your order by #{delivery_time}",
      to: @phone_number,
      from: "+16175536756")
end

def delivery_time
  hour = Time.now.hour
  minute = Time.now.min
  if minute < 10
    "#{hour + 1}:0#{minute}"
  else
    "#{hour + 1}:#{minute}"
  end
end

end
