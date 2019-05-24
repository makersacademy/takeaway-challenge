require 'bigdecimal'

class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = BigDecimal(price, 4)
  end

  def to_s
    "#{name}: £#{format(price)}"
  end

  private

  def format(amount)
   (amount.truncate(2).to_s('F') + '00')[ /.*\..{2}/ ]
  end
end