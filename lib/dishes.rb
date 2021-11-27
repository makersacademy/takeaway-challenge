class Dishes
  attr_reader :dishes

  def initialize
    @dishes = [
      { id: 1, name: "Mushroom Risotto", price: 8, availability: 10 }, 
      { id: 2, name: "Pepperoni Pizza", price: 4, availability: 30 },
      { id: 3, name: "Cheeseburger", price: 5, availability: 20 },
      { id: 4, name: "Prawn Noodles", price: 8, availability: 15 },
      { id: 5, name: "Fries", price: 3, availability: 40 },
      { id: 6, name: "Onion Rings", price: 3, availability: 15 },
      { id: 7, name: "Coca-Cola", price: 2, availability: 40 },
      { id: 8, name: "Ice-cream", price: 2, availability: 15 }
    ]
  end
end
