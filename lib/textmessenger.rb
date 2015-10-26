require 'twilio-ruby'

class TextMessenger

  def initialize(client=Twilio::REST::Client)
    @client = client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_text
    time = (Time.now + (60*60)).strftime("%H:%M")
    @client.account.messages.create(
    	from: ENV['TWILIO_PHONE'],
    	to: '+447780330410',
      body: "Thank you! Your order will be delivered before #{time}")

    "You will shortly receive an SMS confirming your order."
  end

end
