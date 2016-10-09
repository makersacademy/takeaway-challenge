class Menu

  def initialize
    @menu = {"taco"=>1.00, "burrito"=>1.50, "chips"=>1.00, "queso"=> 0.50, "guacamole"=>0.50}
  end

  def show_menu
    puts "See the menu:"
    puts @menu
  end
end
