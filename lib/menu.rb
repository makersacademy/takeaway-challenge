class Menu
  LIST = [
    { name: "Fish and Chips", price: 1295 },
    { name: "Roast Dinner",   price: 1495 },
    { name: "Avocado Toast",  price: 1995 },
    ]

  attr_reader :list

  def initialize(list = LIST)
    @list = list
  end

  def display
    list.each do |dish|
      print format_name(dish[:name]) + format_price(dish[:price])
    end
  end

  private
  def format_name(name)
    "\u2022 #{name.ljust(20, ' ')}"
  end

  def format_price(price)
    "£%.2f\n" % (price / 100.00)
  end
end
