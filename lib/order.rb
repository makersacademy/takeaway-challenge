class Order
  attr_reader :items
  
  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add_dish(dish_no:, qty:)
    dish = @menu.select(dish_no: dish_no)

    @items << { dish: dish, qty: qty }
  end
end