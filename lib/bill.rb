class Bill

private
  def send_bill(sms)
    require 'twilio-ruby'

    account_sid = "AC4715666debe23f149d464be151553dfc"
    auth_token = "4151bb6d61e0ea11a921d28122e810fc"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: sms,
        to: "+447956352352",    # Replace with your phone number
        from: "+441163265083")  # Replace with your Twilio number

    puts message.sid
  end
end
