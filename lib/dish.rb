require 'money'

class Dish
  Money.locale_backend = :currency

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def formatted
    "#{name}: #{Money.new(price, "GBP").format}"
  end
end
