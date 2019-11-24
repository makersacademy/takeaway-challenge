require 'twilio-ruby'

class Phone

  def initialize(menu = Menu.new)
    order = menu.checkout
  end

  def send_message(order)
    time = Time.now + 3600
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    account_sid = '' #private
    auth_token = '' #private
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '' # Your Twilio number
    to = '' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )

    message
  end


end
