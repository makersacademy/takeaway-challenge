require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :total

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu.parse_file
    @order = order
    @total = 0
  end

  def order_food(item_number)
    index = item_number - 1
    @order.select(index, @menu)
    @total += @order.order_pad[index][:cost]
  end

  def display_menu
    output = ""
    @menu.each_with_index do |item, index| 
      output << "#{index + 1}. #{item[:name]} - £#{item[:cost]}\n"
    end
    puts output
  end

  def display_order
    output = ""
    @order.order_pad.each_with_index do |item, index| 
      output << "#{index + 1}. #{item[:name]} - £#{item[:cost]}\n"
    end
    output << "Total cost: £#{@total}"
    puts output
  end
end
