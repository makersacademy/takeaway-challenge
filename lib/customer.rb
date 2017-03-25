require_relative 'menu'
require_relative 'order'

class Customer

  attr_reader :phone_number, :order

  def initialize(number)
    @phone_number = number
    @order = Order.new
  end

  def view_menu
    Menu::MENU_ITEMS.map do |item|
      "#{item[:food_item]} £#{item[:price]}\n"
    end.inject(:+)
  end

  def select_item(food_item)
    @order.save_order_items(Menu::MENU_ITEMS.select{|item| item[:food_item] == food_item}[0])
  end
end
