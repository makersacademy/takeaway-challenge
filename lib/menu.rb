require_relative "order"

class Menu
  attr_reader :list, :order
  def initialize
    @list = [
      { name: "Margherita", price: 2 },
      { name: "Pepperoni", price: 3 },
      { name: "Fiorentina", price: 3 },
      { name: "La Reine", price: 4 }
    ]
    @order = []
  end

  def add_to_order(dish)
    order_dish = @list.find { |meal| meal[:name] == dish }
    fail "I'm sorry we don't have that dish" if order_dish.nil?

    @order << order_dish
  end
end
