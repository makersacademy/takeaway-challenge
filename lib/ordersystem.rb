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

  def remove_from_order(dish, _quantity = 1)
    fail "The order is currently empty" if empty?

    fail "This isn't on the order" if in_order? dish

    order.delete_if { |hash| hash[:dish] == dish }

  end

  def view_order
  end

  def checkout
  end

  def place_order
  end

  private
  def calculate_price(dish, quantity)
    value = menu.detect { |item| item[:dish] == dish }
    value[:price] * quantity
  end

  def in_order?(dish)
    order.any? { |item| item[:dish] == dish } == false
  end

  def empty?
    order.empty?
  end
end
