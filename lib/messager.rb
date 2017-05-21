require 'twilio-ruby'

class Messager

  TAKEAWAY_NAME = 'Woahaca'

  def initialize
    account_sid = 'ACc50d83349feb2f733b17275226c05939'
    auth_token = 'bc36bf423fc8b6e10239dd160a90434b'
    @twilio_no = '+441233800585'
    @client_no = '+447549626098'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(price)
    delivery_time = (Time.new + 3600).strftime('%H:%M')
    message = @client.account.messages.create(
    :body => "Thank you for ordering with #{TAKEAWAY_NAME}! Your order total is: £#{price} and will be with you by #{delivery_time}.",
    :to => @client_no,
    :from => @twilio_no
    )
  end
end
