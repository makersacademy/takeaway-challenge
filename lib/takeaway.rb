require_relative 'order'
# Takeaway class responsible for controling the order
class Takeaway

  def initialize(menu: menu, order: nil)
    @menu = menu
    @order = (order || Order.new(menu: menu))
  end

  def show_menu
    menu.print_menu
  end

  def place_order(current_order)#, total)
    current_order.each do |dish, quantity|
      order.add(dish, quantity)
      puts order.total
    end
    #fail "Order could not be placed: total given doesn't match sum of dishes given" if order.total != total
    order.total
  end

  private
  attr_reader :menu, :order

end
