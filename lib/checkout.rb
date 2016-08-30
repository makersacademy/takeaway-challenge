require 'twilio-ruby'

class Checkout

  def initialize
    account_sid = 'ACeb6f2f8fca2c3bb2b45acb0403377536'
    auth_token = 'd9e6d86b1eb71e5223069e9a84028076'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def confirm_order
    time = Time.now + 3600
    delivery_time = time.strftime "%H:%M"
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @client.messages.create(from: '+441608610069', to: '+447592076164', body: message)
  end

end
