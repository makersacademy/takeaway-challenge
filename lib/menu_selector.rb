require_relative 'menu'

class MenuSelector
  attr_reader :menu, :total, :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @total = []
  end

  def view_menu
    @menu.menu_list.each do |food, price|
    puts "#{food} - £#{price}"
    end
  end

  def record_order(*order)
    order.each do |food_item|
    @total << @menu.menu_list[food_item]
    end
  end
end
