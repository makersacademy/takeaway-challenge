#understands how to lookup prices for ordered items and make total price
require_relative 'menu'
class PriceCalculator
  include Menu

  def initialize(order)
    @order = order
  end

  def calculate
    total = 0
    @order.each do |hash|
      total += (Menu::MENU[hash[:food]].to_f)*(hash[:quantity].to_f)
      #lookup the price for each ordered food in the menu and multiply it by quantity ordered
    end
    total
  end

  def receipt
    p "The total charge was #{calculate}"
  end


end
