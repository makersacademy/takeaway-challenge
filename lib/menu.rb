class Menu

  attr_reader :menu

  def initialize
    @menu = {
      "Risotto" => 7.99,
      "Large Pizza" => 12.99,
      "Fried Chicken" => 6.99,
      "Green Salad" => 5.99,
      "Pasta" => 8.99,
      "Vegetable Curry" => 6.50,
      "Rice" => 1.99,
      "Steamed Vegetables" => 1.99
    }
  end

  def display
    menu
  end

end
