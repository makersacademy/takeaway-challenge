class Menu
  attr_reader :dishes

  DISHES = { "Pizza" => 4.00,
     "Burger" => 5.00,
     "Lobster" => 12.00,
     "Salmon" => 7.00,
     "Halloumi" => 9.00
    }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end

  def show_menu
    @dishes.each { |item| puts "#{item[0]} - £#{item[1].to_f}" }
  end

end
