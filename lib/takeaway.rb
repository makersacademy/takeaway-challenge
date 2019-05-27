class Takeaway

  attr_reader :menu, :order

  NOT_IN_ORDER_ERROR  = "Cannot remove item as it is not part of the
                        order.".freeze
  NOT_ON_MENU_ERROR   = "Item requested is not available from the menu".freeze
  LOW_QUANTITY_ERROR  = "There are not enough of this item in your order to
                        remove the requested quantity.".freeze

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def use_default_menu
    @menu.create_default
  end

  def view_menu
    @menu.display_menu
  end

  def add_to_order(food_item, quantity)
    fail NOT_ON_MENU_ERROR if not_on_menu(food_item)
    @order.add(food_item, quantity)
  end

  def remove_from_order(food_item, quantity)
    fail NOT_IN_ORDER_ERROR if not_in_order(food_item, _quantity)
    fail LOW_QUANTITY_ERROR if low_quantity(food_item, quantity)
    @order.remove(food_item, quantity)
  end

  def view_order
    @order.display_order
  end

  def pay_for_order
  end

  private

  def not_on_menu(food_item)
    @menu.check_menu_for(food_item)
  end

  def not_in_order(food_item)
    @order.check_order_for(food_item)
  end

  def low_quantity(food_item, quantity)
    @order.check_order_quantity(food_item, quantity)
  end

end
