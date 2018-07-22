class Menu

  attr_reader :starters, :mains, :full_menu
  
  def initialize
    @starters = {
      "poppadoms" => 0.99,
      "chutney" => 0.55,
      "chana dal" => 4.99,
      "secret samosa" => 2.50
    }
    @mains = {
      "tikka masala" => 7.50,
      "rogan josh" => 7.89,
      "saag aloo" => 5.45
    }
    @full_menu = @starters.merge(@mains)
  end

  def print_menus
    print_starter_menu
    print_main_menu
  end
  
  def print_starter_menu
    puts "Starter menu: #{starters}"
  end

  def print_main_menu
    puts "Main menu: #{mains}"
  end

  def available?(item)
    @full_menu.key?(item)
  end
end