class Menu
  attr_reader :dishes
  def initialize
    @dishes = [{ name: "Hamburger", price: 1},
      {name: "Pizza", price: 2},
      {name: "Hotdog", price: 2},
      {name: "Tacos", price: 3},
      {name: "Nachos", price: 1}
    ]
  end
end
