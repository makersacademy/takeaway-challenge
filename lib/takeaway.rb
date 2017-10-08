require 'time'
require_relative './menu.rb'
require_relative './text.rb'

class TakeAway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def read_menu
    menu.show
  end

  def order(dish, quantity = 1)
    raise "Sorry item is not on the menu!" unless menu.on_menu?(dish)
    basket[dish] = [quantity, menu.dishes[dish] * quantity]
    print_selection(dish, quantity)
  end

  def empty_basket
    @basket = {}
  end

  def show_basket
    basket.map { |dish| "#{dish[0]} x #{dish[1][0]} = £#{dish[1][1]}" }.join(", ")
  end

  def order_total
    "Your total is: £#{total}"
  end

  def complete_order(amount)
    raise "Sorry the amount given is incorrect" unless correct_amount(amount)
    Text.new.send "Thank you! Your order will be delivered before #{delivery_time}"
    empty_basket
  end

  private

  def print_selection(dish, quantity)
    quantity >= 2 ? string = "es" : string = ""
    "You've added #{quantity} #{dish} dish" + string + " to your basket"
  end

  def total
    @basket.values.map { |_quantity, price| price }.inject(:+)
  end

  def correct_amount(amount)
    amount == total
  end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end
end
