require_relative "menu"
class Order
  attr_reader :order
  DEFAULT_QUANTITY = 1

  def initialize
    @menu = Menu.new
    @order = []
  end

  def add(dish, quantity = DEFAULT_QUANTITY)
    fail "Item not on the menu." if not_on_menu?(dish)

    quantity.times { @order << { dish => @menu.menu[dish] } }
  end

  def show_order
    @order.each {|item| item.each { |k,v| puts "#{k} - £#{v}" }}
  end

  private
  def not_on_menu?(dish)
    !@menu.menu.include? dish
  end
end
