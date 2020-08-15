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

  def add_to_order(dish, quantity = 1)
    order << { dish: dish, quantity: quantity, price: calculate_price(dish, quantity) }
  end

  private
  def calculate_price(dish, quantity)
    value = menu.detect { |item| item[:dish] == dish }
    value[:price] * quantity
  end
end
