require 'money'

class Dish
  Money.locale_backend = :currency

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = Money.new(price, "GBP")
  end

  def formatted
    "#{name}: #{price.format}"
  end
end
