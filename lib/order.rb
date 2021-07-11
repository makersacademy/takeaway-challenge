require_relative 'menu'

class Order

  attr_reader :order, :menu
 
  def initialize(menu = nil)
    @menu = Menu.new(menu)
    @order = []
  end

  def display_menu
    @menu.display
  end

  def add_item(item, quantity = 1)
    raise 'This item is not on the menu' if not_on_menu?(item)
    quantity.times { @order << find_item(item) }
  end

  def print_total
    puts "Your total is: £#{calculate_total}"
  end

  def print_order
    puts 'Your order:'
    @order.map { |items| print_items(items) }
  end

  def verify_order
    print_order
    print_total
  end

  private 

  def not_on_menu?(item)
    @menu.menu.select { |dish, price| dish == item }.length < 1
  end

  def find_item(item)
    @menu.menu.select { |dish, price| dish == item }
  end

  def calculate_total
    total = 0
    @order.each { |h| total += h.values.sum }
    total
  end

  def print_items(items)
    items.map { |dish, price| puts "#{dish}: £#{price}" }
  end

end