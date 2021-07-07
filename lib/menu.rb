class Menu

  attr_accessor :standard_menu 

  def initialize 
    @standard_menu = { "chicken" => 6, "rice" => 4, "beef" => 6, "pizza" => 6, "fajita" => 6 }
  end

  def print_menu
    @standard_menu.each do |dish, prize|
      puts "#{dish} : #{prize}"
    end
  end
    

end
