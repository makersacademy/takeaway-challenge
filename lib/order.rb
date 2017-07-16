class Order

  attr_reader :total

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0
    @placed = false
  end

  def read_menu
    @menu.to_s
  end

  def basket
    @basket.dup
  end

  def placed?
    @placed
  end

  def add(dish_name, quantity = 1)
    return "Cannot add, order already placed" if placed?
    return "Cannot add, #{dish_name} is not on the menu" unless @menu.dishes[dish_name]
    update_total(@menu.dishes[dish_name], quantity)
    update_quantity(dish_name, quantity)
  end

  def checkout(amount)
    return "Incorrect amount" unless amount == total
    complete_order
  end

  private

  def update_total(dish_price, quantity)
    @total += dish_price * quantity
  end

  def update_quantity(dish_name, quantity)
    @basket[dish_name] += quantity
    "#{quantity}x #{dish_name} added to your basket"
  end

  def complete_order
    @placed = true
  end

end
