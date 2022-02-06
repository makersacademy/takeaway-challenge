require_relative 'takeaway_menu'
class Order

attr_reader :ordered_items

def initialize
  @ordered_items = []
  @menu = { 'Pizza' => 10, 'Fried Rice' => 8, 'Chips' => 4, 'Pepsi' => 2, 'Roti' => 2}
end

def display_items
  menu = Menu.new
  menu.display_menu
end


def choose_dish(name)
  if @menu[name].nil?
    puts "Not in Menu, Please select from menu"
  else
    @ordered_items << name
  end
end

end