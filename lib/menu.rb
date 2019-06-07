class Menu

  attr_reader :menu_contents

  def initialize
    @menu_contents = {"Fish" => 3, "Chips" => 2, "Veggie Burger" => 2, "Mushy Peas" => 0.5, "Curry Sauce" => 0.5, "Ketchup" => 0.2}
  end

  def view
    puts print_header
    menu_contents.each do |key, value|
      puts "#{key}: £#{value.to_f}"
    end
  end

  def print_header
    "Menu"
  end

end
