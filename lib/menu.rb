class Menu
  attr_reader :menu

  def initialize
    @dish = {
      dish: nil,
      price: nil,
      quantity: nil
    }
    @menu = []
  end

  def add_dish(dish, price, quantity)
    @dish[:dish] = dish
    @dish[:price] = price
    @dish[:quantity] = quantity
    @menu << @dish
  end

end