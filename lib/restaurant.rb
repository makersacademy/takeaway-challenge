require_relative 'menu'

class Restaurant

attr_reader :menu

def initialize(menu: Menu.new)
  @menu = menu
  @order = {}
end

def display_menu
  menu.print_menu
end



def order_food(item, quantity = 1)
  fail "That is not on the menu" unless menu.has_key?(item)
end


end
