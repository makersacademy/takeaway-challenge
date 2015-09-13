class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def place_order(menu, dish_number, quantity)
    quantity.times do
      @basket << menu.select(dish_number)
    end
  end

end