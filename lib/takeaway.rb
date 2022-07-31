require_relative 'menu'

class Takeaway
  attr_reader :cart

  DISH_LIST = {
    "pizza" => 5,
    "kebab" => 4,
    "burger" => 6,
    "tacos" => 4,
    "chips" => 1
  }

  def initialize
    @cart = []
  end

  def place_order(items, quantity)
    quantity.times { @cart << DISH_LIST[items] }
      "#{quantity} #{items} added to cart"
  end
end
