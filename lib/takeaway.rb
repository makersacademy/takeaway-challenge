require_relative 'order.rb'
require_relative 'menu.rb'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu || Menu.new
    @order = order || Order.new(menu)
  end

  def print_menu
    menu.print # ? syntax
  end

  def place_order(dishes)
    dishes.each do |dish, quantity| order.add(dish, quantity)
    end
  end

end
