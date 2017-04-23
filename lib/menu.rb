require_relative 'restaurant'
class Menu
  attr_reader :menu, :starters, :mains, :sides, :alcohol, :drinks

  def initialize
    @menu = {}
  end

  m1 = Menu.new
  m1.menu.merge(@starters = {"Battered squid" => 5, "Empanadas" => 8, "Olives" => 3})
  @mains = {"Huel" => 2, "Rump steak" => 16, "Filet mignon" => 25, "Steak sandwich" => 10, "Salmon" => 10}
  @sides = {"Chips" => 2, "Pepper sauce" => 2, "Side salad" => 4,}
  @alcohol = { "Merlot" => 5, "Riesling" => 5, "Prosecco" => 8, "Franziskaner" => 5}
  @drinks = {"Tea" => 2, "Espresso" => 2, "Latte" => 3, "Cappuccino" => 3, "Smoothie" => 5}

end
