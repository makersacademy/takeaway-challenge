require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :orders, :total, :menu

  def initialize(menu)
    @menu = menu.new
    @total_order = []
    @orders = []
  end

  def show_menu(menu)
    menu.list.each do |name, price|
      puts "Menu: #{name} £#{price}"
    end
  end

  def create_order(dish, quantity = 1)
    if menu.list.has_key?(dish)
      order = Order.new(dish, quantity)
      @orders << order
    else
      puts "not available, choose another dish"
    end
  end

  def calculate_total(orders)
    
  end

end



