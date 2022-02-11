require_relative 'takeaway_menu'
class Order

attr_reader :ordered_items, :menu

def initialize
  @ordered_items = []
  @total = 0
  @menu = Menu.new
end

def display_items
  @menu 
  menu.display_menu
end


def choose_dish(name)
    
  if menu.display_menu[name].nil?
    puts "Not in Menu, Please select from menu"
  else
    @ordered_items << name
  end
end

def final_total
  # menu = Menu.new
  @ordered_items.each do |name|
   
    @total += @menu.display_menu[name]
    
  end
  return @total
end
  

end