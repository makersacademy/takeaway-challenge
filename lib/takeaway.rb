require './lib/menu'
require './lib/order'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = Order.new(@menu)
  end 

  def read_menu
    @menu.show_menu
  end

  def add_to_order(item, quantity)
    @current_order.add(item, quantity)
  end

  def complete_order
    check_order
    print_order
  end 

  private 

  def check_order
    @total = 0
    @current_order.item_list.each do |key, v|
      @total += (@menu.list[key] * v)
    end
    fail 'Error: order total incorrect' unless 
      @total == @current_order.calculate_total
  end

  def print_order
    puts "Your order:"
    @current_order.item_list.each do |k, v| 
      puts "#{k} x #{v}"
    end 
    puts "total: £#{@current_order.calculate_total}"
  end
end 
