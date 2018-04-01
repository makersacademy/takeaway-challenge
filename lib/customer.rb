require_relative 'menu'
class Customer

  attr_reader :order

  def initialize(order = Order.new)

    @order = order

  end

  def view_menu
    Menu::MENU_LIST.map do |item|
      "#{item[:food_item]} £#{item[:price]}\n"

    end.inject(:+)
  end

  def place_order

    @order.save_items(Menu::MENU_LIST)

  end
end
