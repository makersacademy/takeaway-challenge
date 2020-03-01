require_relative 'menu'

class Order

  attr_reader :basket, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @subtotal = 0
  end

  def view_menu
    @menu.view
  end

  def add(dish_name, quantity)
    fail "Quantity not provided. Please try again." unless integer?(quantity)

    fail "Dish not available. Please try again." unless dish_available?(dish_name)

    update_basket(dish_name, quantity)
    update_subtotal(dish_name, quantity)
    confirm_item_added(dish_name, quantity)
  end

  def view_basket
    print_basket
    @subtotal
  end

  def checkout(total)
    fail "Incorrect order total. Please try again." unless totals_match?(total)

    "Thank you! Your order was placed and will be delivered before #{Time.now}"
  end

  private

  def update_basket(dish_name, quantity)
    @basket << { name: dish_name, quantity: quantity }
  end

  def update_subtotal(dish, quantity)
    @subtotal += price_times_quantity(dish, quantity)
  end

  def price_times_quantity(dish, quantity)
    dish_price(dish) * quantity
  end

  def dish_price(dish)
    Menu::ITEMS[dish][:price]
  end

  def integer?(quantity)
    quantity.is_a?(Integer)
  end

  def dish_available?(dish)
    Menu::ITEMS.has_key?(dish)
  end

  def totals_match?(total)
    @subtotal == total
  end

  def confirm_item_added(dish, quantity)
    if dish[-1] == "s" || quantity == 1
      "#{quantity} #{dish} added to basket"
    else
      "#{quantity} #{dish}s added to basket"
    end
  end

  def print_basket
    basket = @basket.map do |dish|
      quantity = dish[:quantity]
      dish_name = dish[:name]
      dish_price = dish_price(dish_name)
      total = price_times_quantity(dish_name, dish[:quantity])

      "#{quantity} x #{dish_name} @ #{dish_price}: #{total}\n"
    end
    puts basket.join(" ")
  end

end
