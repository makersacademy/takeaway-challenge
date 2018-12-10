class Order
  attr_reader :foods

  def initialize(menu)
    @foods = {}
    @menu = menu
  end

  def add_to_order(food, quantity)
    fail "That isn't on the menu!" unless menu.has_food?(food)
    foods[food] = quantity
  end

  def total
    total_cost.inject(:+)
  end

  private

  def total_cost
    foods.map do |food, quantity|
      menu.price(food) * quantity
    end
  end

  attr_reader :menu

end
