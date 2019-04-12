class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{ name: "Pizza", price: 6.00 },
      { name: "Pasta", price: 8.00 },
      { name: "Chips", price: 3.00 },
      { name: "Burger", price: 10.00 },
      { name: "Wrap", price: 4.00 },
      { name: "Oysters", price: 20.00 }]
  end

end
