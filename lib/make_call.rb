require 'twilio-ruby'

class Checkout

  def initialize
    account_sid = 'ACdb0c001d98d842c9465935ffde45fb6b'
    auth_token = 'aa648095dec33b70637f15de4c6c9964'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def confirm_order
    time = Time.now + 3600
    delivery_time = time.strftime "%H:%M"
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @client.messages.create(from: '+441527962217', to: '+447973819428', body: message)
  end

end
