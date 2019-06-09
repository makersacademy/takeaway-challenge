require_relative 'menu'
require_relative 'order'
class Takeaway
  attr_reader :selection
  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    p @menu.list
  end

  def choose_order(meals)
    meals.each do |dish, quantity|
      @order.add_items(dish, quantity)
    end
  end

  def call_order_hello
    @order.hello
  end
end

t = Takeaway.new
o = Order.new
t.show_menu
