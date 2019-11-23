require_relative 'menu'
require_relative 'order'

class Takeaway

  OUT_OF_STOCK = ''

  def initialize(menu = Menu.new, message_client = MessageClient.new, order_class = Order)
    @menu = menu
    @order_class = order_class
    @current_order = @order_class.new
    @message_client = message_client
  end

  def view_menu
    menu = @menu.dishes.map.with_index { |listed, i|
      "Item #{i + 1}: #{formatted(listed[:dish].name)} – £#{listed[:dish].price}"
    }
    menu.join("\n")
  end

  def add_to_order(choice)
    choice = @menu.dishes.select { |existing| choice == existing[:dish] }.first
    raise OUT_OF_STOCK if choice[:available].zero?

    @current_order.add_item(choice[:dish])
    choice[:available] -= 1
  end

  def view_current_order
    @current_order.view
  end

  def place_order
    @message_client.confirm_order
    @current_order = @order_class.new
  end

  private

  def formatted(symbol)
    symbol.to_s.split('_').map { |word| word.capitalize }.join(' ')
  end
end
