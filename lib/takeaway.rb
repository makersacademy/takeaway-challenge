require_relative 'order'
require_relative 'confirmation_text'
# Takeaway class responsible for controling the order
class Takeaway

  def initialize(menu: menu, order: nil, confirmation_text: nil)
    @menu = menu
    @order = (order || Order.new(menu: menu))
    @confirmation_text = (confirmation_text || ConfirmationText.new)
  end

  def show_menu
    menu.print_menu
  end

  def place_order(current_order)
    add_items(current_order)
    confirmation_text.send_text
    order.total
  end

  private
  attr_reader :menu, :order, :confirmation_text

  def add_items(current_order)
    current_order.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
