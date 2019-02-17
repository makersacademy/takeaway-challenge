#!/usr/bin/env ruby
class Menu

  def initialize

    @menu = [
      { item: "1 - Kenjutsu: Chicken, Pepperoni, Green Chili", price: "10.99" },
      { item: "2 - Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage", price: "12.49" },
      { item: "3 - Taijutsu: Prawn, Anchovy, Pineapple, Tripe", price: "15.99" }
    ]

  end

  def list
    @menu.each { |hash| puts " #{hash[:item]}. $#{hash[:price]}" }
  end

end
