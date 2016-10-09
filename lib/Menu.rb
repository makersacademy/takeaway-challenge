class Menu

  def initialize
    @menu = {"Taco"=>1.00, "Burrito"=>1.50, "Chips"=>1.00, "Queso"=> 0.50, "Guacamole"=>0.50}
  end

  def show_menu
    puts "See the menu:"
    puts @menu
  end
end
