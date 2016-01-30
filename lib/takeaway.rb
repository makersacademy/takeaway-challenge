require_relative 'menu.rb'

class Takeaway

  attr_reader :total

  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
    @basket = Hash.new(0)
    @total = 0
  end

  def menu
    @menu.dishes.dup
  end

  def order(dish, quantity=1)
    fail 'Sorry, that item is not on the menu' if menu.has_key?(dish) == false
    @basket[dish] += quantity
    @total += menu[dish] * quantity
  end

  def confirm_order(estimate)
    fail 'Total is not correct, please try again' if estimate != total
    time = Time.new
    "Thanks for your order, it will be delivered by #{time.hour+1}:#{time.min}"
  end

  def basket
    @basket["Total"] = "£#{total}"
    @basket
  end
end
