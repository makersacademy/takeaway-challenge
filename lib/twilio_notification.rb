require 'twilio-ruby'

class TwilioNotification

  attr_reader :client, :delivery

  def initialize(account_sid = 'AC308ba4a10b2f8d5d71937c58814369ab',
                auth_token = '5f97114b5b8512e090126f889df0abbe')
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = '+447480639164'
    @to = '+447917881462'
    @time = Time.now
    @delivery = (@time +1*60*60).strftime('%H:%M')
  end

  def send_message
    client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before #{delivery}"
    )
  end

end
