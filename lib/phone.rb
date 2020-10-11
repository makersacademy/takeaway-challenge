require 'twilio-ruby'

class Phone

  def send_text

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    sender_no = ENV['TWILIO_SENDER_NO']
    receiver_no = ENV['TWILIO_RECEIVER_NO']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime("%k:%m")}",
        to: receiver_no,    # Replace with your phone number
        from: sender_no     # Use this Magic Number for creating SMS
      )

    puts message.sid
  end

  attr_reader :account_sid, :auth_token, :sender_no, :receiver_no
end
