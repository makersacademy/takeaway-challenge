require 'time'
require_relative './menu.rb'
require_relative './text.rb'

class TakeAway
  attr_reader :menu, :basket, :text
  extend Text

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def read_menu
    menu.show
  end

  def order(dish, quantity = 1)
    raise "Sorry item is not on the menu!" if !menu.on_menu?(dish)
    basket[dish] = menu.dishes[dish] * quantity
    print_selection(dish, quantity)
  end

  def empty_basket
    @basket = {}
  end

  def show_basket
    basket.map {|dish| "#{dish[0]}: £#{dish[1]}"}.join(", ")
  end

  def order_total
    "Your total is: £#{@basket.values.sum}"
  end

  def complete_order
    self.send("Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime("%H:%M")}")
    empty_basket
  end

  private

  def print_selection(dish, quantity)
    quantity >= 2 ? string = "es" : string = ""
    "You've added #{quantity} #{dish} dish" + string + " to your basket"
  end

end
