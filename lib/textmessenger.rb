require 'twilio-ruby'

class TextMessenger

  account_sid = 'AC2799c29662a04ae8f7eb70faa94e26c9'
  auth_token = '34775ed3445ea0aa68c0734e8be2c829'

  @client = Twilio::REST::Client.new account_sid, auth_token
  @time = (Time.now + (60*60)).strftime("%H:%M")

  def self.send_text
    @client.account.messages.create{
    	from: '+441873740087',
    	to: '+447780330410',
      body: "Thank you! Your order will be delivered before #{time}"
    }
    "You will shortly receive an SMS confirming your order."
  end

end
