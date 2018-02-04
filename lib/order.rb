require_relative "menu"

class Order


attr_reader :basket, :menu

def initialize(menu = Menu.new)
  @basket = []
  @menu = menu

end

def add(dish, quantity)
  raise "This dish is not on the menu" unless @menu.menu.has_key?(dish)
  @basket << {dish => quantity}
end


end
