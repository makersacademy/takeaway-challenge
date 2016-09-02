#understands how to lookup prices for ordered items and make total price
require_relative 'menu'
class PriceCalculator
  include Menu

  def initialize(order, expected_price)
    @order = order
    @expected_price = expected_price
    p "You can run the 'price_expectations_checker'if you like"
  end

  def calculate
    total = 0
    @order.each do |hash|
      total += (Menu::MENU[hash[0]].to_f)*(hash[1].to_f)
      #lookup the price for each ordered food in the menu and multiply it by quantity ordered
    end
    total
  end

  def receipt
    p "The total charge was #{calculate}"
  end

  def price_expectations_checker
    diff = @expected_price - calculate
    p "Your expected price was different from our calculate price by £#{diff}"
    0
  end
end
