require 'twilio-ruby'

class SendSMS

  def initialize order_summary, total
    send_sms order_summary, total
  end

  def send_sms order_summary, total
    account_sid = 'ACd268326a81162bbacb7d84216a8b7d67'
    auth_token =  'f8a6adaa76de9e0e19ce240c580d4886'
    in1hr = (Time.now + 3600).strftime("%H:%M")
    message = "Your order has been confirmed! It will be delivered by #{in1hr}"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	from: '+441623272327',
    	to: '+447415580694',
    	body: "#{message}\n#{order_summary}\n#{total}",
    })
  end

end
