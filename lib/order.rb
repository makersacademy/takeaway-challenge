require_relative 'menu'
require_relative 'basket'

class Order

  def initialize(menu = Menu.new, basket = Basket.new)
    @menu = menu
    @basket = basket
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

    "Thank you! Your order was placed and will be delivered before #{Time.now}"
  end

  private

  def integer?(quantity)
    quantity.is_a?(Integer)
  end

  def dish_available?(dish)
    Menu::ITEMS.has_key?(dish)
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
