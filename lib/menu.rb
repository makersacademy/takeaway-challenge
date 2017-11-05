class Menu

  attr_reader :list

  def initialize
    @list = [
      {name: "Chicken", quantity: 1, price: 4.5},
      {name: "Chips", quantity: 1, price: 2},
      {name: "Burger", quantity: 1, price: 6}
      ]
  end

end
