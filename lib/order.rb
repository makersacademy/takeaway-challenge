require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :shopping_basket, :menu_hash, :check_price

  def initialize
    @shopping_basket = Hash.new(0)
    @menu = Menu.new
    @check_price = false
    @text = Text.new
  end

  def order_item(dish_num, quantity)
    @shopping_basket[get_item_name(dish_num)] += quantity
    item_added(dish_num)
  end

  def get_item_name(dish_num)
    @menu.menu_arr[dish_num-1]
  end

  def item_added(dish_num)
    "Item number #{dish_num} successfully added to your basket."
  end

  def show_basket
    @shopping_basket.each do |menu_item, quantity|
      return "#{quantity} x #{menu_item}"
    end
  end

  def find_total
    count = 0
    @shopping_basket.each do |(item, price), quantity|
      cost = price * quantity
      count += cost
    end
      return count.round(2)
  end

  def check_price(price)
    fail "Please double-check the price again." if price != find_total
    @check_price = true
    "Please confirm the order."
  end

  def confirm_order
    fail "Please check the price again." if @check_price == false
    "Thank you. A confirmation text will be sent shortly."
    confirmation_text
  end

  def time
    (Time.now + 1*60*60).strftime("%H:%M")
  end

  def confirmation_text
    @text.send_message("Thank you! Your order is estimated to arrive at #{time}")
  end
end
