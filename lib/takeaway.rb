require_relative './menu.rb'
require_relative './order.rb'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def read_menu
    menu.show_menu
  end

  def place_order(basket)
    basket.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order

end
