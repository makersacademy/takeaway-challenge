class Order


  def initialize(menu, customer)
    @menu = menu
    @customer = customer
    @basket = []
  end

  def total
    @basket.sum{ |dish| @menu.dishes[dish] }
  end

  def add_dish(dish)
    fail "Item not on the menu." if !@menu.dishes[dish]
    
    @basket << dish
  end

  def checkout
  end
end
