require 'twilio-ruby'

class MessageSender

  def self.send_message(order_id, host, to, message)
   new.send_message(order_id, host, to, message)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(order_id, host, to, message)
    @client.account.messages.create(
      from:  twilio_number,
      to:    my_number,
      body:  delivery_confirmation(message),
      status_callback: "http://#{host}/orders/#{order_id}/status"
    )
  end

private

def delivery_time
  (Time.now + (60 * 60)).strftime("%H:%M")
end

def delivery_confirmation(message)
  message = "Your order will be delivered at #{delivery_time}"
end

def twilio_number
 ENV['TWILIO_PHONE_NUMBER']
end

def my_number
 ENV['MY_NUMBER']
end

end
