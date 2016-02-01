require_relative 'order'
require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :basket, :order_cost

  def initialize(menu)
    @menu = menu
    @basket = {}
    @order_cost = Order.new
  end

  def show_menu
    @menu.dishes.dup
  end

  def order(item, number=1)
    @basket["#{item} x#{number}"] = @menu.price(item) * number
    @order_cost.add(price(item,number))
    "You ordered #{item} x#{number}"
  end

  def total
    "Total order cost: £#{@order_cost.total}"
  end

  def check_total
    @order_cost.total == basket_summary
  end

  def reset
    @basket = {}
    @order_cost = 0
  end

  def complete_order
    send_text(message)
    reset
    "Thank you, come again."
  end

  def basket_summary
    basket_total = 0
    @basket.reduce {|item, price| basket_total += price}
    basket_total
  end

  private

  def send_text(message)
    account_sid = ENV['TWILIO_ID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.messages.create(
    to: ENV['MY_PHONE_NUMBER'],
    from: ENV['MY_TWILIO_PHONE'],
    body: message
    )
  end

  def message
    message = "Your order comes to £#{order_cost.total}, and will be with you in 1 hour"
  end

  def price(item, number)
    @menu.price(item) * number
  end

end
