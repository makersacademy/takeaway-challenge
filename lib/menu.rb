class Menu

  def initialize

    @menu = [
      {item: 1, pizza: "Kenjutsu: Chicken, Pepperoni, Green Chili"},
      {item: 2, pizza: "Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage"},
      {item: 3, pizza: "Taijutsu: Prawn, Anchovy, Pineapple, Tripe"}
    ]

  end

  def list
    @menu
  end

end
