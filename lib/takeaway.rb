require 'takeaway'
require 'order'
class Takeaway

  def initialize(menu:, order: nil) #is injected menu
    @menu = menu
    @order = order || Order.new #passing order by default
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity| # chicken, x3
      order.add(dish, quantity) #order object
    end
  end

 private

 attr_reader :menu, :order  #menu accesable

end
