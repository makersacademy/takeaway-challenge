require_relative "menu"

class Order


attr_reader :basket, :menu

def initialize
  @basket = []
  @menu = menu

end

def add(dish, quantity)
  @basket << {dish => quantity}
end


end
