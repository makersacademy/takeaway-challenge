require 'takeaway_menu'
class Order

attr_reader :ordered_items

def initialize
  @ordered_items = []
  @total = 0
end

def display_items
  menu = Menu.new
  menu.display_menu
end


def choose_dish(name)
    menu = Menu.new
  if menu.display_menu[name].nil?
    puts "Not in Menu, Please select from menu"
  else
    @ordered_items << name
  end
end

def final_total
  menu = Menu.new
  @ordered_items.each do |name|
    @total += menu.display_menu[name]
  end
end
  

end