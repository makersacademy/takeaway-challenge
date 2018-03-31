require_relative 'menu'
require_relative 'order'

class Customer

  def initialize(order = Order.new)

    @order = order

  end

  def view_menu
    Menu::MENU_LIST.map do |item|
      "#{item[:food_item]} £#{item[:price]}\n"

    end.inject(:+)
  end

  def select_item(dish)

    order.save_item(dish)

  end
end
