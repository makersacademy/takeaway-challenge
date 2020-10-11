require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order 

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.print_menu
  end

  def add_to_order(item, quantity = 1)
    @menu.item_available?(item) ? @order.add_item(item, quantity) : not_available
  end

  def place_order(payment)
    item_prices = @order.map do |order|
      order.map { |item, quantity| quantity * @menu[item] }
    end
    final_price = item_prices.flatten.inject(:+)
    final_price == payment ? @order.finalize_order(payment) : incorrect_payment
  end

  private 

  def not_available
    raise "Please select items from the menu."
  end

  def incorrect_payment
    raise "Incorrect payment."
  end

end
