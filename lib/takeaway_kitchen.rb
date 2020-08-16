class TakeawayKitchen

  def initialize
    @menu = [
      { dish: "Chicken Satay", price: 3 }, 
      { dish: "Spring Rolls", price: 3 },
      { dish: "Crispy Prawns", price: 3 },
      { dish: "Pad Thai", price: 7 },
      { dish: "Panang Curry", price: 7 },
      { dish: "Cashew Stir-fry", price: 7 },
      { dish: "Steamed Rice", price: 2 },
      { dish: "Egg Fried Rice", price: 2 },
    ]
  end

  def menu
    @menu.dup
  end
end
