require 'twilio-ruby'

class TextMessenger

  @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def self.send_text
    @client.account.messages.create(
    	from: ENV['TWILIO_PHONE'],
    	to: '+447780330410',
      body: "Thank you! Your order will be delivered before #{@time}")

    "You will shortly receive an SMS confirming your order."
  end

end
