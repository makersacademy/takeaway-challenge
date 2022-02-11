class Restaurant
  attr_reader :menu, :read

  def initialize
    @menu = { "Tiramisu" => 3.65, "Nutella Cheesecake" => 6.15, "Coke" => 3.35, 
    "Appletiser" => 3.25, "San Pellegrino Water" => 2.90, "Bruschetta" => 6.45, 
    "Garlic Bread" => 6.15, "Risotto" => 11.95, "Lasagne" => 13.45, 
    "Arrabbiata" => 9.95, "Bolognese" => 12.95, "Pomodoro" => 11.95, 
    "Margherita" => 10.45, "Calzone" => 15.45, "Verdure" => 11.45 }
    @read 
  end

  def show_menu
    @menu
  end

  def select_dish
  end
end
