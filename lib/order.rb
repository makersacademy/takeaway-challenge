# checks if order is valid, returns order * quantity
class Order
  def initialize(menu, dish_name, quantity)
    @menu = menu
    @dish_name = dish_name
    @quantity = quantity
  end

  def order
    dish = @menu.dish_from_name(@dish_name)
    order = []
    @quantity.times { order << dish unless dish.nil? }
    order
  end

  # private

  # def valid?
end
