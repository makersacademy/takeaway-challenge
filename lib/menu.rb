class Menu

  attr_reader :food_menu, :order

  FOOD_MENU = [{ dish: "Burger", price: 5 }, { dish: "Pizza", price: 7 }]

  def initialize(food = FOOD_MENU, order = Order.new)
    @food_menu = food
    @order = order
  end

  def show_menu
    food_menu.map { |hash|
      "#{hash[:dish]} - £#{hash[:price]}" 
    }.join(", ")
  end

  def order_dish(dish, quantity)
    @dish = dish
    fail "#{dish} not on the menu" unless on_menu?
    price = get_price(dish)
    order.add_dish(dish, quantity, price)
  end

  def get_price(dish)
    food_menu.each { |hash|
      return hash[:price] if hash[:dish] == dish
    }
  end

  private 
  attr_reader :dish
  def on_menu?
    food_menu.any? { |hash| hash[:dish] == dish }
  end

end
