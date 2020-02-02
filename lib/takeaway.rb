require_relative 'order'
require_relative 'menu'

class Takeaway
  include Menu
  attr_reader :orders, :total_cost

  def initialize(order_class = Order)
    @total_cost = 0
    @orders = []
    @order_class = order_class
  end

  def show_menu
    MENU.each do |k,v|
      puts "#{k}. #{v[:dish]} - £#{v[:cost]}"
    end
  end

  def order_item(num, quantity = 1)
    @orders << @order_class.new(num, quantity)
    add_cost
  end
  
  private
  def add_cost
    @total_cost += @orders[-1].cost
  end
end
