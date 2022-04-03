require 'rubygems'
require 'twilio-ruby'

class OrderConfirmation

  def send_text_message
    
    
    account_sid = ENV["ACC_SID"]
    auth_token = ENV["AUTH_TOKEN"]

    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
        to: ENV["PH_NUMBER"],
        from: "+447360542270",
        body: "Thank you! Your order was placed and will be delivered before #{time}")
  end

  def time
    time = Time.now + 1 * 60 * 60
    time.strftime("%I:%M %p")
  end
end
