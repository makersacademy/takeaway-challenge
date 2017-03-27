class Menu

  attr_reader :dishes

  def initialize
    dishes
  end

  def dishes
    {"Cheeseburger" => 6,
    "Hamburger" => 5,
    "Pizza" => 7,
    "Milkshake" => 3,
    "Burrito" => 6}
  end

  def view
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end


end
