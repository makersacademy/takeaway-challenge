require_relative 'menu'

class Order

  attr_reader :selection, :menu

  def initialize
    @selection = []
  end

  def add_to_order(dish, quantity)
    @selection.push({ dish: dish, quantity: quantity })
    p @selection
  end

end
