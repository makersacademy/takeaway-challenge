require_relative 'text'
require_relative 'menu'

class Customer
  include Menu

  attr_reader :text_provider, :basket

  def initialize(text_api=Text.new)
    @basket = []
    @text_provider = text_api
  end

  def add_item(dish, quantity=1)
    if display_menu.key?(dish)
      @basket << dish
      @basket << quantity
    else
      fail 'Item not on menu'
    end
  end

  def verify_and_pay(payment)
    if payment == total
      order_complete
    else
      fail 'Payment failed, please pay correct total.'
    end
  end

  def order_complete
    @text_provider.send_text
    'Thank you, payment has been accepted. You will shortly receive a confirmation text message.'
  end

  def order_total
    total
    "Your order total is: £#{'%.2f' % total}"
  end

  private

  def total
    prices = []
    order = Hash[@basket.each_slice(2).to_a]
    order.each do |dish, quantity|
    prices << display_menu[dish]*quantity
    return prices.inject(:+)
    end
  end
end
