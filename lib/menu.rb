module Menu

  STARTERS = {"Spicy Prawn Cracker": 2.90, "Tempura Mixed Vegetables": 3.90, "Pork Spare Ribs": 4.95, "Thai Fish Cake": 3.95, "King Prawns Tempura": 5.95, "Crispy Seaweed": 3.90, "Chicken Satay": 4.95, "Dim-Sum": 5.45, "Deep-Fried Squid": 5.95, "Mixed Starter": 13.95}.freeze
  CURRIES = {"Thai Green Curry": 7.95, "Red Curry": 7.95, "Yellow Curry": 7.95, "Panang Curry": 8.95, "Massaman Curry": 8.95}.freeze
  NOODLES = {"Phad Thai": 8.50, "Phad Kee Mao": 8.95, "Phad See-Eew": 7.95, "Plain Noodles": 4.95}.freeze
  RICE = {"Thai Steamed Jasmine Rice": 2.95, "Egg Fried Rice with Vegetables": 3.95, "Steamed Coconut Rice": 3.95, "Sticky Rice": 3.95, "Special Rice": 8.95, "Tiien Special Rice": 9.95}.freeze
  ALL_DISHES = STARTERS.merge(CURRIES.merge(NOODLES.merge(RICE)))

end
