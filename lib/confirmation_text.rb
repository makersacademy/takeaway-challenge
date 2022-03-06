require 'twilio-ruby'
class ConfirmationText

  def send_confirmation_text(delivery_time)
    account_sid = ENV['TWILIO_ACCOUNT_SID'] 
    auth_token = ENV['TWILIO_AUTH_TOKEN']   

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{delivery_time}",
        to: ENV['PHONE_NUM'],   
        from: "+18647321533")  

  end
end