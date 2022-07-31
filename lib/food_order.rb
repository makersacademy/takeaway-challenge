require_relative './takeaway_menu'

class FoodOrder

  attr_reader :food_order

  def initialize
    @food_order = []
    @menu = Menu.new
  end

  def add_item(food, number)
    raise "This menu item does not exist" if @menu.menu[food].nil?

    menu_item = @menu.menu.select { |key, _value| key == food }
    number.times { @food_order << menu_item }
    order_sum
  end

  def order_sum
    order_total = 0
    @food_order.each do |order_item|
      order_item.each do |_key, value|
        order_total += value
      end
    end
    puts "The cost of your order is £%.2f" % order_total
  end

end
