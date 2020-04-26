class Menu

  def initialize
    @basket = []
  end

  def show_menu
    @menu = { "dishes" => "price",
    "Tortellini skewers" => 4,
    "Asparagus and mozerella parcels" => 5,
    "Spagetti Carbonara" => 8,
    "Margharita Pizza" => 7,
    "Selection of Icecream" => 3 }
      @menu.each do |dish, price|
        puts "#{dish}: #{price}"
      end
  end
end
