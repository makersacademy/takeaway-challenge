class Restaurant

  MENU = [
    { dish: "Banana pancakes with maple syrup", price: 7.95 },
    { dish: "Brunch burger", price: 7.50 },
    { dish: "Veggie breakfast burrito", price: 8.95 },
    { dish: "Triple tacos", price: 7.95 },
    { dish: "Diner fries", price: 3.20 },
    { dish: "Side of mac and cheese", price: 4.25 },
    { dish: "Coca cola", price: 2.00 },
    { dish: "Fresh orange juice", price: 1.90 }
  ]

  def display_menu
    MENU.each do |food|
      return "#{food[:dish]}, price: £#{food[:price]}"
      # not sure how to make always 2 decimal places
    end
  end

end
