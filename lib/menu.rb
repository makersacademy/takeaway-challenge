class Menu
    
  attr_reader :full_menu
    
  def initialize
    @full_menu = [
        { "1. cheeseburger" => "£5" },
        { "2. bacon burger" => "£6" },
        { "3. veggie burger" => "£6" },
        { "4. chips" => "£3" },
        { "5. cheesey chips" => "£4" },
    ]
  end
  
  def view_menu
    @full_menu
  end
  
  def choose_dishes
    print "what number would you like to order?"
    order = gets.chomp
    menu = Menu.new
    if order == "1"
      "You have chosen #{menu.full_menu[0]}, thank you for ordering"
    end
  end
  
end
