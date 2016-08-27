
class Menu

  def initialize
    @menu = { "Beef Burger" => 8.5 ,
              "Cheese Burger" => 9 ,
              "Honest Burger" => 10.5 ,
              "Tribute Burger" => 10.5 ,
              "Special Burger" => 12.5 ,
              "Chicken Burger" => 9.5 ,
              "Fritter Burger" => 7.5 ,
              "Onion Rings" => 3.5 ,
              "Coleslaw" => 3 ,
              "House Salad" => 3 }
  end

  def check_menu(item)
    fail 'This item is not on the menu' unless @menu.has_key? item
  end

  def price(item)
    @menu[item]
  end

end
