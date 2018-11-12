require 'menu'
require "twilio-ruby"

class Order
attr_reader :selected_order, :total_price

  def initialize(menu)
    @selected_order = menu
    @total_price = 0
  end

  def total
    @total_price = @selected_order.inject { |sum, x| sum + x }
  end

  def confirm_total
    fail 'There are no items in your order!' if @total_price == 0
    fail 'There was a problem calculating your order.' if @total_price != @selected_order.inject { |sum, x| sum + x }
    p "Your order total is £#{@total_price}."
    text
  end

  def text
    account_sid = '--'
    auth_token = '--'
    client = Twilio::REST::Client.new(account_sid,auth_token)

    from = 'Twilio number'
    to = 'Mobile phone number'

    client.messages.create(
    from: from,
    to: to,
    body: "Your order has been placed and will arrive by #{TimeNow.new + 3600}."
    )
  end
end
