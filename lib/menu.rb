class Menu
  attr_reader :menu_items
  
  def initialize 
    @menu_items = [
      {item: "kung po chicken", price: 6.80},
      {item: "chicken chow mein", price: 6.50}
    ]
  end

  def view_menu
  end
  
end