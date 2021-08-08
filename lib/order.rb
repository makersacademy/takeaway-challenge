require_relative 'menu'

class Order

  attr_reader :selection, :menu

  def initialize
    @selection = Hash.new(0)
    @menu = Menu.new
  end

  def add_order(dish, quantity)
    @selection[dish] += quantity
  end
end