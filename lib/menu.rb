class Menu
  attr_reader :items
  attr_writer :items

  def initialize 
    @items = {}
  end
    
  def add_item name, price
    items[name] = price
  end  

  def present_menu
    puts items
  end  
end  
