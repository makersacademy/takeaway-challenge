module Menu

  MENU = [
    { dish: "Dish-01", price: 3.45 },
    { dish: "Dish-02", price: 2.99 },
    { dish: "Dish-03", price: 4.75 },
    { dish: "Dish-04", price: 1.49 },
    { dish: "Dish-05", price: 4.99 }
  ].freeze

  def Menu.menu
    MENU
  end
end
