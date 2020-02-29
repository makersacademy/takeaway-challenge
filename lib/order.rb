require_relative 'menu'

class Order

  attr_reader :dishes, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = []
    @subtotal = 0
  end

  def view_menu
    @menu.view
  end

  def add(dish, quantity)
    fail "Quantity not provided. Please try again." unless integer?(quantity)

    fail "Dish not available. Please try again." unless dish_available?(dish)

    update_dishes(dish, quantity)
    update_subtotal(dish, quantity)
    confirm_item_added(dish, quantity)
  end

  def place(total)
    fail "Incorrect order total. Please try again." unless @subtotal == total

    "Thank you! Your order was placed and will be delivered before #{Time.now}"
  end

  private

  def update_dishes(dish, quantity)
    @dishes << { dish: dish, quantity: quantity }
  end

  def update_subtotal(dish, quantity)
    @subtotal += Menu::ITEMS[dish][:price] * quantity
  end

  def integer?(quantity)
    quantity.is_a?(Integer)
  end

  def dish_available?(dish)
    Menu::ITEMS.has_key?(dish)
  end

  def confirm_item_added(dish, quantity)
    if quantity > 1
      "#{quantity} x #{dish}s added to order"
    else
      "#{quantity} x #{dish} added to order"
    end
  end

end
