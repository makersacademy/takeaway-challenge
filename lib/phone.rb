require 'twilio-ruby'

class Phone

  def initialize(menu = Menu.new)
    order = menu.checkout
  end

  def send_message(order)
    message = "Thank you! Your order was placed and will be delivered before 18:52"
    account_sid = 'AC6ade70ceae5f8a13b5f4e88002a0f9b4'
    auth_token = '9293c61a46a78976c49bc6b8163b0ae7'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+44 1275 595056' # Your Twilio number
    to = '+447807848250' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )

    message
  end


end
