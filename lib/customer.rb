require 'menu'

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

    Menu::MENU_LIST.select{ |item| item[:food_item] == dish }.each{ |item| @order.save_item(item)}

  end
end
