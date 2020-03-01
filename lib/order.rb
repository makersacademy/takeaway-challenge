require_relative 'menu'
require_relative 'basket'
require_relative 'orderconfirmation'

class Order

  def initialize(menu = Menu.new, basket = Basket.new, orderconfirmation = OrderConfirmation.new)
    @menu = menu
    @basket = basket
    @orderconfirmation = orderconfirmation
  end

  def view_menu
    @menu.view
  end

  def add(dish, quantity)
    fail "Quantity not provided. Please try again." unless integer?(quantity)

    fail "Dish not available. Please try again." unless dish_available?(dish)

    process(dish, quantity)
  end

  def view_basket
    @basket.print
  end

  def checkout(total)
    fail "Incorrect order total. Please try again." unless totals_match?(total)

    @orderconfirmation.send_message
  end

  private

  def integer?(quantity)
    quantity.is_a?(Integer)
  end

  def dish_available?(dish)
    @menu.dish_available?(dish)
  end

  def totals_match?(total)
    @basket.subtotal == total
  end

  def process(dish, quantity)
    @basket.update(dish, quantity)
    @basket.update_subtotal(dish, quantity)
    confirm_item_added(dish, quantity)
  end

  def confirm_item_added(dish, quantity)
    if dish[-1] == "s" || quantity == 1
      "#{quantity} #{dish} added to basket"
    else
      "#{quantity} #{dish}s added to basket"
    end
  end
end
