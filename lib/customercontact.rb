require 'twilio-ruby'

class CustomerContact

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send_message(total, details = {from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Thank you for your order - your total is #{total}. Your food will be delivered by #{order_time}."
      })

    from = ENV["TWILIO_NUMBER"] # Your Twilio number
    to = ENV["MY_NUMBER"] # Your mobile phone number

    @client.messages.create(details)

  end

private
  def order_time
    (Time.now + 60*60).strftime("%H:%M")
  end

end
