
class Menu
  
  attr_reader :menu_list, :print_menu

  def initialize
    @menu_list = { 
    Rice: 3.00,
    Chicken: 5.00,
    Salad: 3.00
    }
  end
  
  def print_menu
    menu_list.each { |dish, price| puts "#{dish}: £#{price}" }
  end
end

