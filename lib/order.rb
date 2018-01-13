class Order

  attr_reader :dishes_prices, :menu

  def initialize(menu)
    @dishes_prices = Hash.new(0)
    @menu = menu
  end

  def add(name, qty)
    raise "#{name.capitalize} not on the menu, can't be selected." if menu.includes_dish?(name) == false
    dishes_prices[name] = qty
  end

  def total_amount
    items = dishes_prices.map {|name, qty| menu.get_price(name) * qty }
    items.inject(:+)
  end
end
