require 'order'
class Takeaway
  attr_reader :menu
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quan|
      order.add(dish, quan)
    end
    puts "Your order total is: £15.00"
  end
  private

  attr_reader :menu, :order
end
