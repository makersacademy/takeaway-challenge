require_relative 'menu'

class TakeAway
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Hash.new(0)
  end

  def view_menu
    menu.print
  end

  def add_to_order(dish, amount = 1)
    order[dish] = amount
  end

  private

end
