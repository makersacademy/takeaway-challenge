class Menu

  attr_reader :dishes_prices, :includes_dish

  def initialize(dishes_prices)
    @dishes_prices = dishes_prices
  end

  def printing
    dishes_prices.split(",").map {|name| p name }
  end

  def includes_dish?(name)
    @dishes_prices[name] ? true : false
  end

  def get_price(name)
    dishes_prices[name]
  end

end
