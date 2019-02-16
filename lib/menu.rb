#!/usr/bin/env ruby
class Menu

  def initialize

    @menu = [
      { "1" => "Kenjutsu: Chicken, Pepperoni, Green Chili"},
      { "2" => "Ninjitsu: Spicy Beef, Sweetcorn, Onion, Sausage"},
      { "3" => "Taijutsu: Prawn, Anchovy, Pineapple, Tripe"}
    ]

  end

  def list
    @menu.each { |array| array.each { |key, value| puts "##{key} - #{value}" } }
  end

end
