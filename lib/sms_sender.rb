require "twilio-ruby"

class SmsSender
  def initialize
    @cust_phone_num = "###########" # Enter your receiving phone number here
  end

  def send_text(delivery_message,
                account_sid = "###############################", # Enter account_sid here
                auth_token = "################################", # Enter authorisation token here
                send_phone_num = "############") # Enter your sending phone number here
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: delivery_message,
      to: @cust_phone_num,    # Replace with your phone number
      from: send_phone_num,
    )
    message.sid
  end
end
