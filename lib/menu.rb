
class Menu
  attr_reader :list

  LIST_DISHES = [
    { name: "spaghetti", price: 7, quantity: 8 },
    { name: "meatball", price: 6, quantity: 9 },
    { name: "pizza", price: 9, quantity: 10 }]

  def initialize(list = LIST_DISHES)
    @list = list
  end

  def available_dishes
    list.select { |dish| dish[:quantity] > 0 }
  end

  def update_item(dish_from_basket)
    dish = list.find { |dish| dish[:name] == dish_from_basket[:name] }
    dish[:quantity] -= dish_from_basket[:quantity]
    list
  end
end
