require 'twilio-ruby'

class SendSMS

  def initialize order_summary, total
    send_sms order_summary, total
   end

  def send_sms order_summary, total
    account_sid = ENV['twilio_sid']
    auth_token =  ENV['twilio_token']
    twilio_phone_number = ENV['mattia']
    in1hr = (Time.now + 3600).strftime("%H:%M")
    message = "Your order has been confirmed! It will be delivered by #{in1hr}"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    	from: '+441623272327',
    	to: '+447415580694',
    	body: "#{message}\n#{order_summary}\n#{total}",
    )
  end

end
