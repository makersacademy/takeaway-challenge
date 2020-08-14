require_relative 'takeaway_kitchen'

class OrderSystem
  attr_reader :menu, :order

  def initialize
    @menu = TakeawayKitchen.new.menu
    @order = []
  end

  def view_menu
    menu
  end

  def add_to_order(dish, quantity=1)
    order << {dish: dish, quantity: quantity}
  end
end
