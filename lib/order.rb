require_relative 'menu'
require_relative 'takeaway'
require_relative 'order'

class Order

  def initialize()
    dishes = {}
  end

  def add(dish, quantity)
    dishes << { dish => quantity }
  end

end
