require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :total

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu.parse_file
    @order = order
    @total = 0
  end

  def order_food(item_number, quantity)
    item_number -= 1
    @order.select(item_number, @menu, quantity)
    @total += @order.pad[-1][:cost] * quantity
  end

  def display_menu
    @menu.each_with_index { |item, index| puts "#{index + 1}. #{item[:name]} - £#{item[:cost]}" }
  end

  def display_order
    @order.pad.each do |item|
      puts "#{item[:amount]} x #{item[:name]} - £#{item[:cost]*item[:amount]}"
    end    
    puts "Total cost: £#{@total}"
  end
end
