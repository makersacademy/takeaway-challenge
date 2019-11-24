require_relative 'menu'
require_relative 'order'
require_relative 'message_client'

class Takeaway

  OUT_OF_STOCK = 'The item in question is out of stock'
  ORDER_EXCEEDS_STOCK = 'Customer attempting to order more of an item than is currently available'

  def initialize(menu = Menu.new, message_client = MessageClient.new, order_class = Order)
    @menu = menu
    @order_class = order_class
    @current_order = @order_class.new
    @message_client = message_client
  end

  def view_menu
    @menu.dishes.map.with_index { |listed, i|
      "Item #{i + 1}: #{formatted(listed.dish.name)} – £#{listed.dish.price}"
    }.join("\n")
  end

  def begin_order_for(customer)
    @current_order.assign_customer(customer)
  end

  def add_to_order(choice)
    choice = @menu.dishes.select { |existing| choice == existing.dish }.pop
    raise OUT_OF_STOCK if choice.servings_left.zero?
    raise ORDER_EXCEEDS_STOCK unless choice.servings_left > ordered_servings_of(choice.dish)

    @current_order.add_item(choice.dish)
  end

  def remove_from_order(choice)
    @current_order.remove_item(choice)
  end

  def view_current_order
    "#{formatted(@current_order.customer.name)}'s order:\n#{@current_order.view}"
  end

  def place_order
    @current_order.settle_payment
    @message_client.confirm_order(@current_order.customer)
    set_order_aside
    @current_order = @order_class.new
  end

  # add 'remove item', also add 'add multiple'
  private

  def formatted(symbol)
    symbol.to_s.split('_').map { |word| word.capitalize }.join(' ')
  end

  def set_order_aside
    @current_order.items.each { |ordered|
      menu_listing = @menu.dishes.select { |listed| listed.dish == ordered.dish }.pop
      ordered.quantity.times { menu_listing.register_sale }
    }
  end

  def ordered_servings_of(item)
    ordered_item = @current_order.items.select { |ordered| ordered.dish == item }.pop
    ordered_item.nil? ? 0 : ordered_item.quantity
  end
end
