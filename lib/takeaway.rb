require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize
    @menu = Menu.new
    @current_order = Order.new
  end

  def view_menu
    @menu.items.each_with_index do |item, index|
      puts "#{index + 1}: #{item[:name]} £#{item[:cost]}"
    end
  end

  def order(num)
    @current_order.add(@menu.items[num - 1][:cost])
  end

end

shop = Takeaway.new(Menu.new)
shop.view_menu
shop.order
