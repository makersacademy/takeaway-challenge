require_relative 'basket'

class Takeaway
  def initialize(basket = Basket.new)
    @basket = basket
  end

  def menu
    [
      { name: "mixed meze", price: 10 },
      { name: "lahmacun", price: 4 },
      { name: "chicken shish", price: 10 },
      { name: "iskender kebab", price: 12 },
      { name: "icli kofe", price: 12 },
      { name: "baklava", price: 6 }
    ]
  end

  def add_to_order(dish, quantity)
    raise "Cannot add to order: item is not available. "\
          "Select items from the menu." unless menu.include? dish

    quantity.times { @basket.add(dish) }
    @basket
  end

  def basket
    @basket.contents
  end
  
  def verify(price)
    raise "Cannot verify order: the price was wrong. "\
          "Check your maths! 😜" if price != @basket.total

    true
  end
end
