require 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order:)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print_format
  end

  def order_total(food)
    food.each do |item|
      order.add(item)
    end
  end
end
