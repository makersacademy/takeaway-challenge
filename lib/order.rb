class Order

  def initialize
    @menu
  end

  def menu_list
    @menu = [
      {1 => "fried boogers", price: 3.0 },
      {2 => "dinosaur eggs", price: 10.0 },
      {3 => "golden bones", price: 8.0 },
      {4 =>  "calamari milkshake", price: 5.0 },
      {5 =>  "durian gazpacio", price: 2.0 },
      {6 =>  "flakey teeth", price: 4.0 },
      {7 =>  "flamingo beaks", price: 3.0 },
      {8 =>  "crab toes", price: 3.0 },
      {9 =>  "velociraptor pupils", price: 12.0 },
      {10 =>  "seasoned leaves", price: 4.0 }
    ]
  end

  def view_menu
    print menu_list
  end

end
