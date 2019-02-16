class Menu

  def initialize
    @DISHES = [
      { name: "Burger", price: 3.00 },
      { name: "Steak Burger", price: 4.00 },
      { name: "Chicken Burger", price: 3.00 },
      { name: "Veggie Burger", price: 2.75 },
      { name: "Small Lemonade", price: 0.60 },
      { name: "Small Cola", price: 0.60 },
      { name: "Bottled water (500ml)", price: 0.75 },
      { name: "Large Lemonade", price: 1.00 },
      { name: "Large Cola", price: 1.00 },
      { name: "Small Fries", price: 1.00 },
      { name: "Large Fries", price: 1.50 },
      { name: "Garlic Bread", price: 2.00 },
      { name: "Cheesy Garlic Bread", price: 2.80 },
      { name: "Potato Wedges", price: 2.00 },
      { name: "Chocolate Cake Slice", price: 1.50 },
      { name: "Coconut Cake Slice", price: 1.50 }
    ]
  end

  def list_dishes
    list_of_dishes = []

    @DISHES.each_with_index do |dish, index|
      list_of_dishes << "#{index + 1}. #{dish[:name]} - \u00A3%0.2f\n" %  dish[:price]
    end

    puts "#{list_of_dishes.join}"
  end

end