class Menu
  attr_reader :menu

  def initialize
    @menu = {
      "Chicken Ramen" => 9.95,
      "Yaki Soba" => 8.75,
      "Katsu Curry" => 10.75,
      "Teriyake Donburi" => 10.25,
      "Steak Bulgogi" => 14.50,
      "Yasai Pad Thai" => 9.95,
      "Steamed Rice" => 2,
      "Miso Soup" => 1.95
    }
  end
end
