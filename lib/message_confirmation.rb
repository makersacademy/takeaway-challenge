require 'twilio-ruby'

class MessageConfirmation
  def send_message
    account_sid = "AC540e391202cf1e4b8e12124103ee85e4"
    auth_token = "0e6b0db1fc5a2f9b5a5adda478f481e6"

    begin
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before 18:52",
        to: "",
        from: "+441729292034"
      )

    rescue Twilio::REST::TwilioError => e
      puts e.message
    end
  end
end
