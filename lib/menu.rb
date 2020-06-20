class Menu
    
  attr_reader :full_menu, :my_order
    
  def initialize
    @full_menu = [
        { "1. cheeseburger" => "£5" },
        { "2. bacon burger" => "£6" },
        { "3. veggie burger" => "£6" },
        { "4. chips" => "£3" },
        { "5. cheesey chips" => "£4" },
    ]
    
    @my_order = []
  end
  
  def view_menu
    @full_menu
  end
  
  def choose_dishes(order)
    menu = Menu.new
    @order = order
    raise "Sorry that number is unavailable, please pick again" if @order >= 6
    
    "You have chosen #{menu.full_menu[@order - 1]}, thank you for ordering"
  end
 
  def collect_order
    @my_order << choose_dishes(@order)
  end  
  
  def view_order
    @my_order
  end
  
end
