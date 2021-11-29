require_relative './menu'
require_relative './send_sms'

class TakeAway
  attr_reader :cart

  def initialize(menu: Menu.new, sender: SmsSender.new)
    @menu = menu
    @sender = sender
    @cart = []
  end

  def menu
    @menu.list_dishes
  end

  def add_to_cart(name, quantity = 1)
    new_dish = @menu.select_dish(name, quantity)
    update_dish_quantity(new_dish) || @cart << new_dish
  end

  def update_dish_quantity(new_dish)
    update_existing_dish = false
    @cart.each do |item|
      if item[:dish] == new_dish[:dish]
        item[:quantity] += new_dish[:quantity]
        update_existing_dish = true
      end
    end
    update_existing_dish
  end

  def total_price
    total = @cart.reduce(0) do |memo, item|
      price = item[:price].scan(/\d+[.]\d+/).join.to_f
      memo + (price * item[:quantity])
    end
    "total price: £#{total}"
  end

  def place_order
    raise "The cart is empty, add some items before placing an order!" if @cart.empty?
    message = @sender.send_sms
    @cart = []
    message.body
  end

end
