require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.display_menu
  end

  def select_dishes(dishes)
    dishes.each do |item, quantity|
      @order.add(item, quantity) if @menu.has_dish?(item)
    end
    @order.basket
  end

  def checkout
    total = @order.order_total
    "You\'ve ordered #{total} items."
  end

  def confirm_order(number)
    raise 'Total number of dishes does not match. Please check again.' unless total_correct?(number)
  end

  private

  def total_correct?(number)
    @order.order_total == number
  end

  def bill_total
    @order.basket.map { |k, v| menu.display_menu[k] * v }.reduce(:+)
  end
end
