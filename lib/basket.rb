class Basket
  attr_reader :items
    def initialize(dish, dish_quantity)

      @items = [{dish: dish, quantity: dish_quantity, dish_total_price: dish.price * dish_quantity}]
    end
end
