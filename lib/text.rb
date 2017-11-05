require 'twilio-ruby'

class Text
  def send_text(amount)

    time_plus_hour = (Time.now + (60 * 60)).strftime("%H:%M:%S")

    account_sid = 'AC83bbe6da52f9f4df30a45559b0b58c66'

    auth_token = '851fb010ddf573a29f40951f70f456b4'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      from: '+441158240958',
      to: '+447850523068',
      body: "Your order is £#{amount}! It will arrive before #{time_plus_hour}.")
  end
end
