require 'twilio-ruby'

ACCOUNT_SID = 'ACd5a9f1864bca50ee0aca797630101375'
AUTH_TOKEN = '1dc40490bfb8ad122c5dd7a90427780b'
TWILIO_SENDER = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN).messages

class TakeOut

  MENU = {
  "chicken soup" => 5,
  "icecream" => 3
  }

  def initialize(sender = TWILIO_SENDER)
    @sender = sender
  end

  def show_menu
    MENU
  end

  def process(order)
    @sender.create(
      from: '+441303720101',
      to: '+44 7817 933608',
      body: "Your $#{format("%.2f", order.total)} order will arrive in 1 hour."
    )
  end

end
