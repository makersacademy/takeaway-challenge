class Menu
  attr_reader :menu

  def initialize
    @menu = {
      "pad thai" => 10.50,
      "tofu katsu curry" => 11.00,
      "chow mein" => 8.00,
      "yakisoba" => 7.50,
      "spring rolls" => 6.50,
    }
  end
end
