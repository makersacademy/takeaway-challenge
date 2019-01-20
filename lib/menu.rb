class Menu

  attr_reader :menu

  def initialize
    @menu = {
      "Dough Balls" => 4.49,
      "Cheeseburger" => 6.79,
      "Garlic Pizza Bread" => 3.99,
      "Chicken Wings" => 5.99,
      "Pizza Margherita" => 8.99
    }
  end

end
