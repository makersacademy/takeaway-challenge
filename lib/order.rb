require_relative 'menu'

class Order

  attr_reader :selection, :menu

  def intialize
    @menu = Menu.new
    @selection []
  end

  def add_to_order(dish, quantity)
    @selection = []
    @selection.push({ dish: dish, quantity: quantity })
    p @selection
  end

end
