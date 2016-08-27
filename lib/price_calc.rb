#understands the prices of all items in an order, calculates total price
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
    end
    total
  end

  def receipt
    p "The total charge was #{calculate}"
  end


end
