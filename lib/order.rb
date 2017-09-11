require_relative 'menu'

class Order

attr_reader :order

def initialize
  @menu = Menu.new
  @menu.menu_entries
end

def new_order(item, quantity)
  order = {"#{item} x#{quantity}" => self.[item] * quantity.to_i}
end


end
