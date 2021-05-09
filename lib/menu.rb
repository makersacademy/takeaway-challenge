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

  def select(dish)
    order_dish = @list.find { |meal| meal[:name] == dish }
  end
end
