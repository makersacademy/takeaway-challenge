require_relative 'menu'

class Order

  attr_reader :order, :total

  def initialize
    @menu = Menu.new.print_menu
    @order = []
  end

  def add_items(item)
    @order << @menu[item - 1]
  end

  def check_order
    @total = 0
    @order.each do |item|
      item.each do |item, price|
        puts "#{item}: £#{price}"
        @total += price
      end
    end
    puts "Total: £#{@total}"
  end
end 
