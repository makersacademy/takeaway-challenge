require 'order'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.show
  end

  def order_food(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order

end
