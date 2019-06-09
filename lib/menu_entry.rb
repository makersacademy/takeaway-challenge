class MenuEntry

  attr_reader :dish, :price, :entry

  def initialize
    @entry = { dish: nil, price: nil }
  end

  def add_dish(dish)
    @entry[:dish] = dish
  end

  def add_price(price)
    @entry[:price] = price
  end
end
