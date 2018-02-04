require_relative 'take_away'

require 'twilio-ruby'

class Order
  attr_reader :take_away, :total_amount, :menu

  def initialize(take_away)
    @take_away = take_away
    @total_amount = 0

    sum_amount
  end

  def place_order(_selection, amount)
    raise "Wrong amount for your order" if amount != total_amount

    send_sms("Thanks! Your order was placed and will be delivered before 18:52")
  end

  private

  def sum_amount
    take_away.selection.each do |dish, quantity|
      @total_amount += take_away.menu[dish] * quantity
    end
  end

  def send_sms(_text)
    account_sid = 'XXXXXX'
    auth_token = 'XXXXXX'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: '++123456',
      to: '+123456',
      body: "Thanks! Your order was placed and will be delivered before 18:52"
    )
  end
end
