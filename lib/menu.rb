class Menu
  attr_accessor :menu

  def initialize
    @menu = [
      { "meal" => "Fish", "price" => 2.00 },
      { "meal" => "Chips", "price" => 1.00 },
      { "meal" => "Hamburger", "price" => 2.00 },
      { "meal" => "Spaghetti", "price" => 2.50 },
      { "meal" => "Salad", "price" => 1.00 },
    ]
  end

  def list

  end
end
