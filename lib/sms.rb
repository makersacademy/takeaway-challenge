require 'twilio-ruby'
class Sms

  

  def send_sms
    account_sid = ENV[Twilio-SID]
     auth_token =  ENV[Twilio_token]
     twilio_phone = ENV[fergt]
     phone = ENV[ferg]
     in1hr = (Time.now + 3600).strftime("%H:%M")
     message = "Your order has been confirmed! It will be delivered by #{in1hr}"
     @client = Twilio::REST::Client.new account_sid, auth_token

     @client.account.messages.create(
         from: twilio_phone,
         to: phone,
         body: "#{message}\n",
     )
  end
end
