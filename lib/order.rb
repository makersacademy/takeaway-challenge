require_relative 'menu'

class Order

  attr_reader :menu, :order

  def initialize(menu = nil)
    @menu = Menu.new(menu)
    @order = []
  end

  def display_menu
   @menu.print 
  end

  def add_dish(dish, quantity = 1)
    raise 'Sorry, this item is not on our menu.' if on_menu?(dish)
    quantity.times { @order << find_dish(dish) }
  end

  def print_total
    puts "The total for your order is £#{total_cost}"
  end

  def print_order 
    puts "Your order is:"
    @order.map { |dishes| print_dishes(dishes) }
  end

  def checks_order
    print_order
    print_total
  end

  private

  def on_menu?(item)
    @menu.menu.select { |dish, price| dish == item }.length < 1
  end

  def find_dish(item)
    @menu.menu.select { |dish, price| dish == item }
  end

  def total_cost
    total = 0
    @order.each { |price| total += price.values.sum }
    total
  end

  def print_dishes(dishes)
    dishes.map { |dish, price| puts "#{dish}: £#{price}" }
  end

end
