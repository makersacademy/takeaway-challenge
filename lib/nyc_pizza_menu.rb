class NYCPizzaMenu
  def menu
    [
      { name: "Garlic Bread Bites", nickname: :garlic_bread, price: 5.50 },
      { name: "Tomato Basil", nickname: :tomato, price: 6.50 },
      { name: "Spiced Eggplant", nickname: :eggplant, price: 11.00 },
      { name: "BBQ Seitan", nickname: :bbq, price: 18.00 },
      { name: "Pabst Blue Ribbon", nickname: :pabst, price: 5.00 },
      { name: "Diet Coke", nickname: :diet_coke, price: 4.50 }
    ]
  end

  def name
    "NYC"
  end

  def logo
    "🍕🍕🍕"
  end
end
