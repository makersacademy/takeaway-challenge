class Menu

  def prices(order)
    prices = {
     "Peking duck" => 9.9,
     "Crispy chili Beef" => 6.9,
     "Black bean sauce green pepper" => 6.9,
     "Prawn spring rolls" => 3.9,
     "Sesame prawn toast" => 5.9,
     "Chicken balls (large)" => 5.9,
     "Chicken balls (small)" => 3.9,
     "Crispy Seaweed" => 4.9,
     "Special fried rice" => 4.9,
     "Egg fried rice" => 3.4,
     "Rice" => 2.9,
     "Hoisin sauce" => 1.4,
     "Szechuan sauce" => 1.4
   }
   prices[order]

 end

  def printer
    [
      "Peking duck: £9.90",
    "Crispy chili Beef: £6.90",
    "Black bean sauce green pepper: £6.90",
    "Prawn spring rolls: £3.90",
    "Sesame prawn toast: £5.90",
    "Chicken balls (large): £5.90",
    "Chicken balls (small): £3.90",
    "Crispy Seaweed: £4.90",
    "Special fried rice: £4.90",
    "Egg fried rice: £3.40",
    "Rice: £2.90",
    "Hoisin sauce: £1.40",
    "Szechuan sauce: £1.40"
  ]
  end
end
