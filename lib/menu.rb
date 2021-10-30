class Menu

  attr_reader :menu_items
  
  def initialize(menu_items = {"Prawn chow mein" => 4.50, "Egg fried rice" => 2.50})
    @menu_items = menu_items
  end

  def show_menu
    @menu_items 
  end 

end 