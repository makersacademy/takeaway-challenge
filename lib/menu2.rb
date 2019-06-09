require_relative 'menu_entry'

class Menu

  attr_reader :menu, :entry, :dish, :price

  def initialize
    @entry = { dish: nil, price: nil }
    @menu = []
  end

  def add_dish(dish)
    @entry[:dish] = dish
  end

  def add_price(price)
    @entry[:price] = price
  end

  def add_entry
    @menu << @entry
  end
end
