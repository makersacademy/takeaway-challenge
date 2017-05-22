require 'hidden.rb'
require 'twilio-ruby'

class Messenger

def initialize(mobile_number = +447956248363)
account_sid = ACCOUNT_SID
auth_token = AUTH_TOKEN
@client = Twilio::REST::Client.new account_sid, auth_token
@delivery_time = (Time.new + 3600).strftime('%H:%M')
@twilio_number = "+441233800406"
@client_number = mobile_number
end


  def send_confirmation_sms(order)
    text_body = "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
  message = @client.account.messages.create(:body => text_body,
      :to => @client_number,
      :from => @twilio_number)
  end

end
