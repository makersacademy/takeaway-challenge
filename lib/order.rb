# checks if order is valid, returns order * quantity
class Order
  attr_reader :name, :price
  attr_accessor :quantity

  def initialize(menu, dish_name, quantity)
    @menu = menu
    @name = dish_name
    @price = @menu.dish_from_name(dish_name).price
    @quantity = quantity
  end

  def valid?
    @menu.dish_from_name(@name) != nil
  end
end
