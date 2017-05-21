require 'twilio-ruby'

class Messager

  TAKEAWAY_NAME = 'Woahaca'
  
  def initialize
    account_sid = 'ACc50d83349feb2f733b17275226c05939'
    auth_token = 'bc36bf423fc8b6e10239dd160a90434b'
    @twilio_no = '+441233800585'
    @client_no = '+447840301956'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(price)
    message = @client.account.messages.create(
    :body => "Thanks for your order from #{TAKEAWAY_NAME}! Your order total is: £#{price}.",
    :to => @client_no,
    :from => @twilio_no
    )
  end
end
