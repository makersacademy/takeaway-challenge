require 'twilio-ruby'

class Twillo

  def initialize(items, basket_total)
    @items = items
    @basket_total = basket_total
    @hour_time = ((Time.now) + (60 * 60 + 10)).strftime("%H:%M")
  end

  def body
    @body = "Your order with Tommy Takeaway has been placed successfully. You ordered #{@items} items, totalling £#{@basket_total}. Your order will arrive before #{@hour_time}."
    @body
  end

  def confirmation_message
    account_sid = 'ACed7738d1369354c9bfa210c0f34192e3'
    auth_token = 'bd38b7fe3bee5cdad6c5802d26cb0d76'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: '+441597800011',
      to: '+447876353692',
      body: body
    )
  end
end
