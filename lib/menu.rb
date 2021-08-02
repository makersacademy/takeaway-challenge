class Menu 
  attr_reader :menu_items
  def initialize
    @menu_items = {
      "tori" => 6,
      "squid" => 5,
      "pork" => 8,
      "ginger" => 11,
      "king" => 12,
      "chicken" => 10
    }
  end

  def display
    @menu_items.map { |dish, price| "#{dish}: £#{price}" }.join(", ")
  end
end
