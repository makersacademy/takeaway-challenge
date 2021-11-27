class Dishes
  attr_reader :dishes

  def initialize
    @dishes = [
      { name: "Mushroom Risotto", price: 8 }, 
      { name: "Pepperoni Pizza", price: 4 },
      { name: "Cheeseburger", price: 5 },
      { name: "Prawn Noodles", price: 8 },
      { name: "Fries", price: 3 },
      { name: "Onion Rings", price: 3 },
      { name: "Coca-Cola", price: 2 },
      { name: "Ice-cream", price: 2 }
    ]
  end
end
