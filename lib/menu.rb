class Menu

  attr_reader :dishes_prices, :includes_dish

  def initialize(dishes_prices)
    @dishes_prices = dishes_prices
  end

  def printing
    dishes_prices.split(",").map {|name| p name }
    # dishes_prices.map { |name, price| "%s £%.2f" % [name.to_s, price] }.join(", ")
  end

  def includes_dish?(name)
    @dishes_prices[name] ? true : false
  end

  def get_price(name)
    dishes_prices[name]
  end

end
