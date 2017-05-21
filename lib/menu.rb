require_relative 'dish'
require_relative 'order'

class Menu

  def initialize
    @menu = []
    default_menu
  end

  def read_menu
    @menu.dup
  end

  def take_order
    @order = Order.new
    rand(0..5).times do |i|
      _dish = @menu[i]
      _quantity = rand(1..2)
      @order.add_dish(_dish, _quantity)
    end
    @order.display_order
  end

  def contains?(dish)
    @menu.include?(dish)
  end

private
  attr_reader :menu

  def default_menu
    @menu << Dish.new('fried chicken', 7.50)
    @menu << Dish.new('roast lamb', 9.40)
    @menu << Dish.new('fresh salad', 2.50)
    @menu << Dish.new('french fried', 1.50)
    @menu << Dish.new('cheesecake', 3.40)
    @menu << Dish.new('fruit salad', 3.95)
  end

end
