class Menu

  DISHES = {  "Chips"                   => 2.00,
              "Hamburger"               => 3.00,
              "Cheeseburger"            => 3.50,
              "Chicken Nuggets"         => 2.50,
              "Cheese and Tomato Pizza" => 8.00,
              "Water 500ml"             => 1.00,
              "Coca-Cola 500ml"         => 1.50
            }

  attr_reader :menu

  def initialize
    @menu = DISHES
  end

  def index_to_item(index)
    menu.flatten[(index.to_i * 2) - 2]
  end

  def index_to_price(index)
    menu.flatten[(index.to_i * 2) - 1]
  end

end
