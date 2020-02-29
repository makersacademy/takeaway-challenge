require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @order = []
    @total = 0
    @menu = menu
  end

  def display
    raise "No items in basket. Please select dishes" if @order.length.zero?
  end

  def add(dish, quantity)
    price = find_price dish
    @total += price
    @order.push[dish, quantity, price * quantity]
  end

  def find_price dish
    dish_details = @menu.menu.select { |item| item[:name] == dish }[0][:price]
  end
end
