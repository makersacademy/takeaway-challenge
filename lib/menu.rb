class Menu
  attr_reader :menu
  def initialize
    @menu = {"Margherita" => 8, "Pepperoni" => 10, "Spiced Salami" => 11.50,"Carbonara" => 12.50, "Tiramisu" => 5.50 }
  end

  def print_menu
    a = @menu.map{|key, value| p  "#{key} is at £#{value}"}
    p a.join("\n")
  end
end
