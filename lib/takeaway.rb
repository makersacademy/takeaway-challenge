require_relative 'order'
require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    menu.show
  end

  def order_food(dishes)
    # dishes.each do |dish, quantity|
    #   @order.add(dish, quantity)
    # end
    # order.total
  end

  private

  attr_reader :menu, :order

end
