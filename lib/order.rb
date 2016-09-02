require_relative 'price_calc'
require_relative 'dispatch'


class Order

  def initialize(order, expected_price, calc=PriceCalculator)
    @calc = calc.new(order, expected_price)
  end

  def checkout
    @calc.calculate
    Dispatch.new.send_sms
    @calc.receipt
  end

end
