require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu: Menu.new.items, order: Order.new)
    @menu = menu
    @order = order
  end

  def display(ordermenu)
    ordermenu.display
  end

  def place_order(dishes)
    message = "No such dish on the menu"
    dishes.each do |dish, quantity|
      fail message unless menu.find { |x| x[:dish] == dish }
      menu.find do |y|
        order.add(dish, y[:price], quantity) if y[:dish] == dish
      end
    end
    order.totals
  end

  private

  attr_reader :menu, :order

end
