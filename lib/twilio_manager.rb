require 'twilio-ruby'

account_sid = "ACc8bf463332d90739fc9ed41325d107a0" 
auth_token = "56b538cec43e98be7cf26aa566ff0b4b"   

class TwilioManager

  def initailize 
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  
  def send_sms
    @client.messages.create(
    to: "+447885918000",        #using dummy number
    from: "+17739853303", 
    body: "Thank you! Your order was placed and will be delivered before #{time}"
      )
    puts "You will receive an SMS message to confirm your order"
  end
    
  def time
    t = Time.now + 1*60*60
    t.strftime('%H:%M')
  end
  
end