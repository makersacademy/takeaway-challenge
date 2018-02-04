require_relative "menu"

class Order


attr_reader :basket, :menu

def initialize(menu = Menu.new)
  @basket = []
  @menu = menu

end

def add(dish, quantity)
  @basket << {dish => quantity}
end


end
