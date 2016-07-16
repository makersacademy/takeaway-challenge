class Menu

  attr_reader :menu

  def initialize
    @menu = {"Chicken Gyoza" => 4.20,
             "Katsu Curry & Rice" => 8.50,
             "Nettle Soup" => 2.00,
             "Bento Box" => 5.60,
             "Edamame" => 3.00,}
  end

  def item_exists?(item)
    @menu.has_key?(item)
  end
  
end
