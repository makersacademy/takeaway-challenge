require_relative 'menu'

class TakeAway

  attr_reader :cart

  def initialize(menu)
    @menu = menu
    @cart = Hash.new(0)
  end

  def show_menu
    menu.print_menu
  end

  def add_item(dish, number = 1)
    fail 'dish does not exit!' unless dish_in_menu?(dish)
    cart[dish] += number
  end

  def cart_summary
    print_cart
    print_total
  end

  def order_total
    total = 0
    cart.each {|d,num| total += (price(d) * num)}
    total
  end

  private

  attr_reader :menu

  def price(dish)
    menu.dish_price(dish)
  end

  def print_cart
    cart.each {|d, num| puts "#{num} X #{d} = $#{price(d) * num}"}
  end

  def print_total
    puts "total: $#{order_total}"
  end

  def dish_in_menu?(dish_name)
    menu.dish_in_menu?(dish_name)
  end

end