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
    basket.each { |dish, quantity| order.add(dish, quantity) }
    order.total
  end

  def total_amount
    order.total
  end

  def finalise_order(price)
    raise 'The total amount is not correct.' unless correct_total?(price)
    @order
  end

  private

  attr_reader :menu, :order

  def correct_total?(price)
    total_amount == price
  end

end
