require 'order'

class Menu

attr_reader :menu

  def initialize
    @menu = {
      "Fried rice" => 8,
      "Kung Po chicken" => 8.5,
      "Singapore fried noodles" => 9,
      "Chicken curry" => 7.5,
      "Coconut rice" => 3
    }
  end

  def view_menu
    return @menu
  end

  def create_order
    @order = Order.new
  end

  def select_dish(dish, quantity)
    added_item = {dish => @menu[dish]}
    quantity.times{@order.push(added_item)}
  end
end
