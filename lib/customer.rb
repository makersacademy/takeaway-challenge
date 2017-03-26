require_relative 'menu'
require_relative 'order'
require_relative 'texter'

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
    @order.save_order_items(Menu::MENU_ITEMS.select { |item| item[:food_item] == food_item}[0])
  end

  def place_order(list_of_items, total_cost)
    items_to_order(list_of_items)
    confirm_order_text(total_cost)
  end

  private

  def items_to_order(list_of_items)
    list_of_items.each do |food_item, quantity|
      quantity.times { select_item(food_item.to_s) }
    end
  end

  def confirm_order_text(total_cost)
    return unless @order.check_order_total(total_cost)
    Texter.new.send_message(@phone_number)
  end
end
