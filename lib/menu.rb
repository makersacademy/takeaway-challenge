class Menu

  attr_reader :dishes_prices

  def initialize(dishes_prices)
    @dishes_prices = dishes_prices
  end

  def printing
    dishes_prices.map { |name, price| "%s £%.2f" % [name.to_s, price] }.join(", ")
  end

end
