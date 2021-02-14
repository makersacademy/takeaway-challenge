require 'twilio-ruby'

class Text
  attr_reader :from, :to

  def initialize
    account_sid = 'AC5fe05dfe905688785a8e0fc5cb03c952'
    auth_token = '31575102d86a1cbf72641823d5a9a932'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = '+447429699897'
    @to = '+447927712807'
  end

  def send_text
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will
    be delivered before #{(Time.now + 10 * 60 * 6).strftime("%k:%M")}"
    )
  end

end
