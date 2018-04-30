require './docs/menu'
require './docs/sms'

class Order

  attr_reader :menu, :basket, :order_summary_array

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @order_summary_array = []
  end

  def display_menu
    @menu.show_menu
  end

  def add_dish(dish, quantity)
    @basket[dish] = quantity
  end

  def cost
    menu_for_price = Menu.new
    menu_hash = menu_for_price.menu_items
    basket_hash = @basket
    menu_hash
    basket_hash
    multiply = menu_hash.map { |k, v| v * basket_hash[k] if basket_hash.key? k }.compact
    total_cost = multiply.inject(:+)
    total_cost
    "Order total: £#{total_cost}"
  end

  def enter_payment(payment_amount)
    # @payment_amount = payment_amount
    "Submitting your payment of £#{payment_amount}"
  end

  def place_order(payment_amount, total_cost, time = Time.now)
    raise "Unable to place order. Please enter the correct payment amount." if payment_amount != total_cost
    time = (time + 3600).strftime("%H:%M")
    if payment_amount == total_cost then "Thanks for your order. It will be delivered to you by #{time}" else false
    end
  end

  def send_sms
    SMS.send_sms("Thank you! Your order was placed and will be delivered before #{@time}")
  end

end
