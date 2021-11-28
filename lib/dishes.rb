class Dishes
  attr_reader :dishes

  def initialize
    @dishes = [
      { id: 1, name: "Mushroom Risotto", price: 8, available: 10 }, 
      { id: 2, name: "Pepperoni Pizza", price: 4, available: 30 },
      { id: 3, name: "Cheeseburger", price: 5, available: 20 },
      { id: 4, name: "Prawn Noodles", price: 8, available: 15 },
      { id: 5, name: "Fries", price: 3, available: 40 },
      { id: 6, name: "Onion Rings", price: 3, available: 15 },
      { id: 7, name: "Coca-Cola", price: 2, available: 40 },
      { id: 8, name: "Ice-cream", price: 2, available: 15 }
    ]
  end

  def is_available?(dish_id, amount)
    raise "Not enough available dishes, select a lower amount or a different dish please" if @dishes[dish_id - 1][:available] < amount
  end
end
