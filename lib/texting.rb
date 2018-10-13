# This class handles the sms functionality with twilio
require 'twilio-ruby'
require 'customer'


class SmsText

  # sends the message
  def send_text
    init_msg(confirm_order)
  end

  private

  # Links functionality with twilio
  def init_msg(msg)
    account_sid = 'ACcb0e21414d3ab3d87192fa33e93fc1c0' # => please change if testing
    auth_token = 'fc23137ee0ee4262f9c677df35211a4d'    # => please change if testing
  # set up a client to talk to the twilio REST API
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  # send an sms
    @client.messages.create(
    from: '+15403519705', # => please change if testing
    to: '+12102941400',   # => please change if testing
    body: msg
    )
  end

  # Prints the confirm message
  def confirm_order
    time = Time.new
   "Thank ya. We'll be there at #{time.hour + 1}:#{time.min}."
  end
end
