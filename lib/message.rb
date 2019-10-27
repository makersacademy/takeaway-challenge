require 'twilio-ruby'
require_relative 'takeaway'
require_relative 'order'

class Message

  def send_message
    time = Time.now + 1 * 60 * 60
    account_sid = 'AC235481255507c7e22cbe41b1512dd666'
    auth_token = '4e9c8ca3dac137e2ca52b7280e1ed671'

    client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+441829470020' # Twilio num
  to = '+447786356423' # Mob Num

    client.messages.create(
   from: from,
   to: to,
   body: "Thank you! Your order has been placed and will be delivered by #{time.hour} :#{time.min}."
  )
  end
end
