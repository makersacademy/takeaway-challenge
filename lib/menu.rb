class Menu
  attr_reader :menu

  def initialize
    @menu = [
      { item: "Chips", cost: 1.0 },
      { item: "Burger", cost: 3.5 },
      { item: "Coke", cost: 0.8 }
    ]
  end

end
