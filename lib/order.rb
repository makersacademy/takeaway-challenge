class Order

  attr_reader :status, :menu, :basket

  def initialize(menu = Menu.new)
    @status = "STARTED"
    @menu = menu
    @basket = {}
  end

  def add_to_basket(dish, number)
    @menu.dishes.each { |k, v| new_value = v * number
      if k == dish
        @basket.store(k, new_value)
      end
    }
  end

  def remove_from_basket(dish)
    @basket.each { |k, v| k == dish ? @basket.delete(k) : "No such dish in basket" }
  end

  def total
    @basket.values.inject { |a, b| a + b }
  end

  def place
    @status = "ORDER PLACED"
    "Your order has been placed"
  end

end
